import { withFilter } from 'graphql-subscriptions';

import requiresAuth, { requiresTeamAccess } from '../permissions';
import pubsub from '../pubsub';

const NEW_CHANNEL_MESSAGE = 'NEW_CHANNEL_MESSAGE';

let serverurl = '';

export default {
  Subscription: {
    newChannelMessage: {
      subscribe: requiresTeamAccess.createResolver(
        withFilter(
          () => pubsub.asyncIterator(NEW_CHANNEL_MESSAGE),
          (payload, args) => payload.channelId === args.channelId
        )
      ),
    },
  },
  Message: {
    url: (parent, args, { serverUrl }) => {
      return parent.url
        ? `${serverUrl ? serverUrl : serverurl}/${parent.url}`
        : parent.url;
    },
    user: ({ user, userId }, args, { models }) => {
      if (user) {
        return user;
      }

      return models.User.findOne({ where: { id: userId } }, { raw: true });
    },
  },
  Query: {
    messages: requiresAuth.createResolver(
      async (parent, { channelId, cursor }, { models, user }) => {
        const channel = await models.Channel.findOne({
          raw: true,
          where: { id: channelId },
        });

        if (!channel.public) {
          const member = await models.PCMember.findOne({
            raw: true,
            where: { channelId, userId: user.id },
          });
          if (!member) {
            throw new Error('Not Authorized');
          }
        }
        const options = {
          order: [['created_at', 'DESC']],
          where: { channelId },
          limit: 35,
        };
        if (cursor) {
          options.where.created_at = {
            [models.op.lt]: cursor,
          };
        }
        return models.Message.findAll(options, { raw: true });
      }
    ),
  },
  Mutation: {
    createMessage: requiresAuth.createResolver(
      async (parent, { file, ...args }, { models, user, serverUrl }) => {
        try {
          const messageData = args;
          if (file) {
            messageData.filetype = file.type;
            messageData.url = file.path;
            serverurl = serverUrl;
          }
          const message = await models.Message.create({
            ...messageData,
            userId: user.id,
          });

          const asyncFunc = async () => {
            const currentUser = await models.User.findOne({
              where: {
                id: user.id,
              },
            });

            pubsub.publish(NEW_CHANNEL_MESSAGE, {
              channelId: args.channelId,
              newChannelMessage: {
                ...message.dataValues,
                user: currentUser.dataValues,
              },
            });
          };

          asyncFunc();

          return true;
        } catch (err) {
          console.log(err);
          return false;
        }
      }
    ),
  },
};

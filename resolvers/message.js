import requiresAuth from '../permissions';
export default {
  Message: {
    user: ({ userId }, args, { models }) => {
      return models.User.findOne({
        where: { id: userId }
      });
    }
  },
  Query: {
    messages: requiresAuth.createResolver(
      async (parents, { channelId }, { models, users }) => {
        let messages = await models.Message.findAll(
          { order: [['created_at', 'ASC']], where: { channelId } },
          { raw: true }
        );

        return messages;
      }
    )
  },
  Mutation: {
    createMessage: requiresAuth.createResolver(
      async (parent, args, { models, user }) => {
        try {
          await models.Message.create({ ...args, userId: user.id });
          return true;
        } catch (error) {
          console.log(error);
          return false;
        }
      }
    )
  }
};

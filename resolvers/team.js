import formatErrors from '../formatErrors';
import requiresAuth from '../permissions';

//{ where: { owner: user.id } },

export default {
  Query: {
    allTeams: requiresAuth.createResolver(
      async (parent, args, { models, user }) => {
        return models.Team.findAll({ owner: user.id }, { raw: true });
      }
    )
  },
  Mutation: {
    createTeam: requiresAuth.createResolver(
      async (parent, args, { models, user }) => {
        try {
          await models.Team.create({ ...args, owner: user.id });
          return {
            ok: true
          };
        } catch (err) {
          console.log(err);
          return {
            ok: false,
            errors: formatErrors(err)
          };
        }
      }
    )
  },
  Team: {
    channels: ({ id }, args, { models, user }) =>
      models.Channel.findAll({ teamId: id })
  }
};

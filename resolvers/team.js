import formatErrors from '../formatErrors';
export default {
  Mutation: {
    createTeam: async (parent, args, context) => {
      try {
        await context.models.Team.create({ ...args, owner: context.user.id });
        return { ok: true };
      } catch (error) {
        console.log(error);
        return { ok: false, errors: formatErrors(error) };
      }
    }
  }
};

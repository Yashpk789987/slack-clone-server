import formatErrors from '../formatErrors';
import requiresAuth from '../permissions';

export default {
  Mutation: {
    addTeamMember: requiresAuth.createResolver(
      async (parent, { email, teamId }, { models, user }) => {
        try {
          const memberPromise = models.Member.findOne(
            {
              where: { teamId, userId: user.id }
            },
            { raw: true }
          );

          const usertoAddPromise = models.User.findOne(
            { where: { email } },
            { raw: true }
          );

          const [member, usertoAdd] = await Promise.all([
            memberPromise,
            usertoAddPromise
          ]);

          if (!member.admin) {
            return {
              ok: false,
              errors: [
                { path: 'email', message: 'You cannot add members to the team' }
              ]
            };
          }

          if (!usertoAdd) {
            return {
              ok: false,
              errors: [
                {
                  path: 'email',
                  message: 'Could not find user with this email'
                }
              ]
            };
          }

          await models.Member.create({ userId: usertoAdd.id, teamId });

          return {
            ok: true
          };
        } catch (err) {
          console.log(err);
          return {
            ok: false,
            errors: formatErrors(err, models)
          };
        }
      }
    ),
    createTeam: requiresAuth.createResolver(
      async (parent, args, { models, user }) => {
        try {
          const response = await models.sequelize.transaction(async () => {
            const team = await models.Team.create({ ...args });
            await models.Channel.create({
              name: 'general',
              public: true,
              teamId: team.id
            });
            await models.Member.create({
              userId: user.id,
              admin: true,
              teamId: team.id
            });
            return team;
          });
          return {
            ok: true,
            team: response
          };
        } catch (err) {
          console.log(err);
          return {
            ok: false,
            errors: formatErrors(err, models)
          };
        }
      }
    )
  },
  Team: {
    channels: ({ id }, args, { models }) =>
      models.Channel.findAll({ where: { teamId: id } })
  }
};

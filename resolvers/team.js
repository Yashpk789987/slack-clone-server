import formatErrors from '../formatErrors';
import requiresAuth from '../permissions';

export default {
  Query: {
    allTeams: requiresAuth.createResolver(
      async (parent, args, { models, user }) => {
        return models.Team.findAll(
          { where: { owner: user.id } },
          { raw: true }
        );
      }
    )
  },
  Mutation: {
    addTeamMember: requiresAuth.createResolver(
      async (parent, { email, teamId }, { models, user }) => {
        try {
          const teamPromise = models.Team.findOne(
            {
              where: { id: teamId }
            },
            { raw: true }
          );

          const usertoAddPromise = models.User.findOne(
            { where: { email } },
            { raw: true }
          );

          const [team, usertoAdd] = await Promise.all([
            teamPromise,
            usertoAddPromise
          ]);

          if (team.owner !== user.id) {
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
            errors: formatErrors(err)
          };
        }
      }
    ),
    createTeam: requiresAuth.createResolver(
      async (parent, args, { models, user }) => {
        try {
          const team = await models.Team.create({ ...args, owner: user.id });
          await models.Channel.create({
            name: 'general',
            public: true,
            teamId: team.id
          });
          return {
            ok: true,
            team
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
    channels: ({ id }, args, { models }) =>
      models.Channel.findAll({ where: { teamId: id } })
  }
};

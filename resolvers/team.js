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
    ),
    inviteTeams: requiresAuth.createResolver(
      async (parent, args, { models, user }) => {
        return models.sequelize.query(
          'select * from teams join members on id = team_id where user_id = ?',
          {
            replacements: [user.id],
            model: models.Team
          }
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
            errors: formatErrors(err, models)
          };
        }
      }
    ),
    createTeam: requiresAuth.createResolver(
      async (parent, args, { models, user }) => {
        try {
          const response = await models.sequelize.transaction(async () => {
            const team = await models.Team.create({ ...args, owner: user.id });
            await models.Channel.create({
              name: 'general',
              public: true,
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

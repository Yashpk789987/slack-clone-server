export default `
  type Team {
    id : Int!
    name : String!
    owner: Int!
    members: [User!]!
    channels: [Channel!]!
  }

  type CreateTeamResponse {
    ok: Boolean!
    errors: [Error!]
    team : Team
  }

  type Query {
    allTeams : [Team!]!
    inviteTeams : [Team!]!
  }

  type VoidResponse {
    ok: Boolean!
    errors : [Error!]
  }

  type Mutation {
    createTeam(name: String!): CreateTeamResponse!
    addTeamMember(email: String! , teamId: Int!) : VoidResponse!
  }
`;

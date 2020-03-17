"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = "\n  type User {\n    id: Int!\n    username: String!\n    email: String!\n    messages: Message!\n    teams: [Team!]!\n  }\n  type Query {\n    me: User!\n    allUsers: [User!]!\n    getUser(userId : Int!) : User\n  }\n\n  type RegisterResponse {\n    ok: Boolean!\n    user: User\n    errors: [Error!]\n  }\n\n  type LoginResponse {\n    ok: Boolean!\n    token: String\n    refreshToken: String\n    errors: [Error!]\n  }\n\n  type Mutation {\n    register(\n      username: String!\n      email: String!\n      password: String!\n    ): RegisterResponse!\n\n    login(email: String!, password: String!): LoginResponse!\n  }\n";
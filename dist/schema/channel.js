"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = "\n  type Channel {\n    id: Int!\n    name: String!\n    public: Boolean!\n    messages: [Message!]!\n    users: [User!]!\n    dm: Boolean!\n  }\n\n  type ChannelResponse {\n    ok : Boolean!,\n    channel : Channel\n    errors : [Error!]\n  }\n\n  type DMChannelResponse {\n    id: Int!\n    name: String!\n  }\n\n  type Mutation {\n    createChannel(\n      teamId: Int!\n      name: String!\n      public: Boolean = false\n      members : [Int!]\n    ): ChannelResponse\n    getOrCreateChannel(teamId : Int! , members: [Int!]!) : DMChannelResponse!\n  }\n";
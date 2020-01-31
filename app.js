var cookieParser = require('cookie-parser');
var logger = require('morgan');
require('dotenv').config();
import express from 'express';
import { ApolloServer } from 'apollo-server-express';
import { makeExecutableSchema } from 'graphql-tools';
import models from './models';
import path from 'path';
import { fileLoader, mergeTypes, mergeResolvers } from 'merge-graphql-schemas';

const types = fileLoader(path.join(__dirname, './schema'));
const typeDefs = mergeTypes(types);

const resolvers = mergeResolvers(
  fileLoader(path.join(__dirname, './resolvers'))
);

console.log(resolvers);

const schema = makeExecutableSchema({
  typeDefs,
  resolvers
});

var app = express();
const server = new ApolloServer({
  typeDefs,
  resolvers,
  context: { models, user: { id: 4 } }
});
server.applyMiddleware({ app });

app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

models.sequelize.sync().then(() => {
  console.log('Database Synced');
});

app.listen(process.env.PORT || 3000, () =>
  console.log(`🚀 Server ready at http://localhost:3000${server.graphqlPath}`)
);

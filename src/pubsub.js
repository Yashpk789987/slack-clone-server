import { RedisPubSub } from 'graphql-redis-subscriptions';

export default new RedisPubSub({
  connection: {
    host: '127.0.0.1',
    port: 6379,
    retryStrategy: times => Math.min(times * 50, 2000)
  }
});

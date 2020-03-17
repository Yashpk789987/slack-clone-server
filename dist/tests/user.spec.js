'use strict';

var _axios = require('axios');

var _axios2 = _interopRequireDefault(_axios);

var _xmlhttprequest = require('xmlhttprequest');

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

global.XMLHttpRequest = _xmlhttprequest.XMLHttpRequest;

describe('user resolvers', () => {
  test('allUsers', async () => {
    const response = await _axios2.default.post('http://localhost:3000/graphql', {
      query: `query{
        allUsers {
            id
            username
            email
        }
      }`
    });

    const { data } = response;
    expect(data).toMatchObject({
      data: {
        allUsers: []
      }
    });
  });

  test('register', async () => {
    const response = await _axios2.default.post('http://localhost:3000/graphql', {
      query: `mutation
        {
            register (username : "TestUser" , email : "TestUser@gmail.com" , password :"TestUser@gmail.com"){
                ok
                user {
                    username
                    email
                }
                errors {
                    path
                    message
                }
            }
        }`
    });

    const { data } = response;
    expect(data).toMatchObject({
      data: {
        register: {
          ok: true,
          user: {
            username: 'TestUser',
            email: 'TestUser@gmail.com'
          },
          errors: null
        }
      }
    });

    const response2 = await _axios2.default.post('http://localhost:3000/graphql', {
      query: `mutation{
        login(email : "TestUser@gmail.com" , password : "TestUser@gmail.com"){
            token
            refreshToken
        }
      }`
    });

    const {
      data: {
        login: { token, refreshToken }
      }
    } = response2.data;

    const response3 = await _axios2.default.post('http://localhost:3000/graphql', {
      query: `
        mutation {
            createTeam(name: "Team 1") {
                ok
                team {
                  name
                }
            }
        }
      `
    }, {
      headers: {
        'x-token': token,
        'x-refresh-token': refreshToken
      }
    });
    expect(response3.data).toMatchObject({
      data: {
        createTeam: {
          ok: true,
          team: {
            name: 'Team 1'
          }
        }
      }
    });
  });
});
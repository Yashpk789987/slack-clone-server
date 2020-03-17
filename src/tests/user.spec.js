import axios from 'axios';

import { XMLHttpRequest } from 'xmlhttprequest';

global.XMLHttpRequest = XMLHttpRequest;

describe('user resolvers', () => {
  test('allUsers', async () => {
    const response = await axios.post('http://localhost:3000/graphql', {
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
    const response = await axios.post('http://localhost:3000/graphql', {
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

    const response2 = await axios.post('http://localhost:3000/graphql', {
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

    const response3 = await axios.post(
      'http://localhost:3000/graphql',
      {
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
      },
      {
        headers: {
          'x-token': token,
          'x-refresh-token': refreshToken
        }
      }
    );
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

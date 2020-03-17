'use strict';

var _regenerator = require('babel-runtime/regenerator');

var _regenerator2 = _interopRequireDefault(_regenerator);

var _asyncToGenerator2 = require('babel-runtime/helpers/asyncToGenerator');

var _asyncToGenerator3 = _interopRequireDefault(_asyncToGenerator2);

var _axios = require('axios');

var _axios2 = _interopRequireDefault(_axios);

var _xmlhttprequest = require('xmlhttprequest');

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

global.XMLHttpRequest = _xmlhttprequest.XMLHttpRequest;

describe('user resolvers', function () {
  test('allUsers', (0, _asyncToGenerator3.default)( /*#__PURE__*/_regenerator2.default.mark(function _callee() {
    var response, data;
    return _regenerator2.default.wrap(function _callee$(_context) {
      while (1) {
        switch (_context.prev = _context.next) {
          case 0:
            _context.next = 2;
            return _axios2.default.post('http://localhost:3000/graphql', {
              query: 'query{\n        allUsers {\n            id\n            username\n            email\n        }\n      }'
            });

          case 2:
            response = _context.sent;
            data = response.data;

            expect(data).toMatchObject({
              data: {
                allUsers: []
              }
            });

          case 5:
          case 'end':
            return _context.stop();
        }
      }
    }, _callee, undefined);
  })));

  test('register', (0, _asyncToGenerator3.default)( /*#__PURE__*/_regenerator2.default.mark(function _callee2() {
    var response, data, response2, _response2$data$data$, token, refreshToken, response3;

    return _regenerator2.default.wrap(function _callee2$(_context2) {
      while (1) {
        switch (_context2.prev = _context2.next) {
          case 0:
            _context2.next = 2;
            return _axios2.default.post('http://localhost:3000/graphql', {
              query: 'mutation\n        {\n            register (username : "TestUser" , email : "TestUser@gmail.com" , password :"TestUser@gmail.com"){\n                ok\n                user {\n                    username\n                    email\n                }\n                errors {\n                    path\n                    message\n                }\n            }\n        }'
            });

          case 2:
            response = _context2.sent;
            data = response.data;

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

            _context2.next = 7;
            return _axios2.default.post('http://localhost:3000/graphql', {
              query: 'mutation{\n        login(email : "TestUser@gmail.com" , password : "TestUser@gmail.com"){\n            token\n            refreshToken\n        }\n      }'
            });

          case 7:
            response2 = _context2.sent;
            _response2$data$data$ = response2.data.data.login, token = _response2$data$data$.token, refreshToken = _response2$data$data$.refreshToken;
            _context2.next = 11;
            return _axios2.default.post('http://localhost:3000/graphql', {
              query: '\n        mutation {\n            createTeam(name: "Team 1") {\n                ok\n                team {\n                  name\n                }\n            }\n        }\n      '
            }, {
              headers: {
                'x-token': token,
                'x-refresh-token': refreshToken
              }
            });

          case 11:
            response3 = _context2.sent;

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

          case 13:
          case 'end':
            return _context2.stop();
        }
      }
    }, _callee2, undefined);
  })));
});
'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.tryLogin = exports.refreshTokens = exports.createTokens = undefined;

var _jsonwebtoken = require('jsonwebtoken');

var _jsonwebtoken2 = _interopRequireDefault(_jsonwebtoken);

var _lodash = require('lodash');

var _lodash2 = _interopRequireDefault(_lodash);

var _bcryptjs = require('bcryptjs');

var _bcryptjs2 = _interopRequireDefault(_bcryptjs);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var salt = _bcryptjs2.default.genSaltSync(10);

const createTokens = exports.createTokens = async (user, secret, secret2) => {
  const createToken = _jsonwebtoken2.default.sign({
    user: _lodash2.default.pick(user, ['id', 'username'])
  }, secret, {
    expiresIn: '1h'
  });

  const createRefreshToken = _jsonwebtoken2.default.sign({
    user: _lodash2.default.pick(user, 'id', 'username')
  }, secret2, {
    expiresIn: '7d'
  });

  return [createToken, createRefreshToken];
};

const refreshTokens = exports.refreshTokens = async (token, refreshToken, models, SECRET, SECRET2) => {
  let userId = -1;
  try {
    const {
      user: { id }
    } = _jsonwebtoken2.default.decode(refreshToken);
    userId = id;
  } catch (err) {
    return {};
  }

  if (!userId) {
    return {};
  }

  const user = await models.User.findOne({ where: { id: userId }, raw: true });

  if (!user) {
    return {};
  }

  const refreshSecret = user.password + SECRET2;

  try {
    _jsonwebtoken2.default.verify(refreshToken, user.password + SECRET2);
  } catch (err) {
    return {};
  }

  const [newToken, newRefreshToken] = await createTokens(user, SECRET, SECRET2);
  return {
    token: newToken,
    refreshToken: newRefreshToken,
    user
  };
};

const tryLogin = exports.tryLogin = async (email, password, models, SECRET, SECRET2) => {
  const user = await models.User.findOne({ where: { email }, raw: true });
  if (!user) {
    return {
      ok: false,
      errors: [{ path: 'email', message: 'Wrong Email' }]
    };
  }

  const valid = _bcryptjs2.default.compareSync(password, user.password);
  if (!valid) {
    return {
      ok: false,
      errors: [{ path: 'password', message: 'Wrong password' }]
    };
  }

  const refreshTokenSecret = user.password + SECRET2;

  const [token, refreshToken] = await createTokens(user, SECRET, SECRET2);

  return {
    ok: true,
    token,
    refreshToken
  };
};
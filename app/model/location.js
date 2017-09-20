'use strict';

module.exports = app => {
  const { STRING, INTEGER, DATE } = app.Sequelize;

  const Location = app.model.define('location', {
    id: {
      type: INTEGER,
      primaryKey: true,
    },
    name: STRING(20),
    count: INTEGER,
    pinyin_short: STRING(20),
    pinyin_full: STRING(50),
    created_at: {
      type: DATE,
      default: new Date(),
    },
    updated_at: {
      type: DATE,
      default: new Date(),
    },
  });

  // User.findByLogin = function* (login) {
  //   return yield this.findOne({ login: login });
  // }

  // Location.findAll = function* () {
  //   return yield this.findAll();
  // };

  // User.prototype.logSignin = function* () {
  //   yield this.update({ last_sign_in_at: new Date() });
  // }

  return Location;
};

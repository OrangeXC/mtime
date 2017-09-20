'use strict';

const fs = require('fs');

module.exports = app => {
  app.beforeStart(async () => {
    // 应用会等待这个函数执行完成才启动
    await app.model.sync({ force: true });

    app.database = await app.mysql.createInstance(app.config.mysql.client);

    const locations = JSON.parse(fs.readFileSync('./init/location.json'));

    await app.mysql.insert('locations', locations.data);
  });
};

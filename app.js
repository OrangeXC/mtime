'use strict';

const fs = require('mz/fs');

module.exports = app => {
  app.beforeStart(async () => {
    // The application will wait for this function to complete before starting
    await app.model.sync({ force: true });

    app.database = await app.mysql.createInstance(app.config.mysql.client);

    const locations = await fs.readFile('./init/location.json');

    await app.mysql.insert('locations', JSON.parse(locations).data);
  });
};

'use strict';

const { Random } = require('mockjs');

const locationId = Random.string('number', 1, 3);
const movieId = Random.string('number', 1, 8);

const mocks = {
  locations: [],
  location: {
    id: locationId,
  },
  movieId,
};

const mockHelper = app =>
  app.mockContext({
    helper: {
      getLocation: async () => ({
        location: mocks.location,
        locations: mocks.locations,
      }),
    },
  });

module.exports = {
  mocks,
  mockHelper,
};

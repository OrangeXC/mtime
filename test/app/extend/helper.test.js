'use strict';
const { app, assert } = require('egg-mock/bootstrap');

describe('helper: getLocation()', () => {
  const mocks = {
    locations: [{
      id: 290,
      name: '北京',
    }, {
      id: 292,
      name: '上海',
    }],
  };

  it('should query location', async () => {
    const ctx = app.mockContext({
      query: {
        location: 290,
      },
      model: {
        Location: {
          findAll: () => mocks.locations,
        },
      },
    });

    const loc = await ctx.helper.getLocation(ctx);

    assert.deepEqual(loc, {
      locations: mocks.locations,
      location: {
        id: 290,
        name: '北京',
      },
    });
  });

  it('should cookie location', async () => {
    const ctx = app.mockContext({
      cookies: {
        get: () => 292,
      },
      model: {
        Location: {
          findAll: () => mocks.locations,
        },
      },
    });

    const loc = await ctx.helper.getLocation(ctx);

    assert.deepEqual(loc, {
      locations: mocks.locations,
      location: {
        id: 292,
        name: '上海',
      },
    });
  });

  it('should default location', async () => {
    const ctx = app.mockContext({
      model: {
        Location: {
          findAll: () => mocks.locations,
        },
      },
    });

    const loc = await ctx.helper.getLocation(ctx);

    assert.deepEqual(loc, {
      locations: mocks.locations,
      location: {
        id: 290,
        name: '北京',
      },
    });
  });
});

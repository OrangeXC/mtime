'use strict';

const { app, assert } = require('egg-mock/bootstrap');
const { mocks, mockHelper } = require('../../helpers');

const url = '/new';

describe('controller: new', () => {
  beforeEach(() => {
    mockHelper(app);

    app.mockHttpclient(`https://api-m.mtime.cn/Movie/MovieComingNew.api?locationId=${mocks.location.id}`, {
      data: [],
    });
  });

  it('should status 200 and get the html', async () => {
    await app.httpRequest()
      .get(url)
      .expect(200)
      .expect(/<!doctype html>/);
  });

  it('should render method have been called right', async () => {
    let renderData;

    app.mockContext({
      render: (tpl, data) => {
        renderData = { tpl, data };
      },
    });

    await app.httpRequest().get(url);

    assert.deepEqual(renderData, {
      tpl: 'page/new.tpl',
      data: {
        location: mocks.location,
        locations: mocks.locations,
        movieComingNew: {},
      },
    });
  });
});

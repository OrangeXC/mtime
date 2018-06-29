'use strict';

const { app, assert } = require('egg-mock/bootstrap');
const { mocks, mockHelper } = require('../../helpers');

const url = `/movie/${mocks.movieId}`;

describe('controller: movie', () => {
  beforeEach(() => {
    mockHelper(app);

    app.mockHttpclient(`https://ticket-api-m.mtime.cn/movie/detail.api?locationId=${mocks.location.id}&movieId=${mocks.movieId}`, {
      data: {
        data: {
          basic: {
            type: [ 'a', 'b' ],
          },
        },
      },
    });

    app.mockHttpclient(`https://ticket-api-m.mtime.cn/movie/hotComment.api?movieId=${mocks.movieId}`, {
      data: {
        data: [],
      },
    });

    app.mockHttpclient(`https://api-m.mtime.cn/Movie/ImageAll.api?movieId=${mocks.movieId}`, {
      data: {
        images: [],
      },
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
      tpl: 'page/movie.tpl',
      data: {
        location: mocks.location,
        locations: mocks.locations,
        movieDetail: {
          basic: {
            type: [ 'a', 'b' ],
          },
        },
        movieComment: [],
        movieImages: [],
        id: mocks.movieId,
      },
    });
  });
});

'use strict';

const { app, assert } = require('egg-mock/bootstrap');
const { mocks, mockHelper } = require('../../helpers');

const url = `/comment/${mocks.movieId}?page=1`;

describe('controller: comment/normal', () => {
  beforeEach(() => {
    mockHelper(app);

    app.mockHttpclient(`https://ticket-api-m.mtime.cn/movie/detail.api?locationId=${mocks.location.id}&movieId=${mocks.movieId}`, {
      data: {
        data: {},
      },
    });

    app.mockHttpclient(`https://api-m.mtime.cn/Showtime/HotMovieComments.api?pageIndex=1&movieId=${mocks.movieId}`, {
      data: {
        data: {
          tpc: 3,
        },
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
      tpl: 'page/comment.tpl',
      data: {
        location: mocks.location,
        locations: mocks.locations,
        movieDetail: {},
        comments: {
          tpc: 3,
        },
        pages: [ 1, 2, 3 ],
        currentPage: '1',
        movieId: mocks.movieId,
      },
    });
  });
});

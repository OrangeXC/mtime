'use strict';

module.exports = app => {
  class VideoController extends app.Controller {
    async index(ctx) {
      const locations = await ctx.model.Location.findAll();

      let location;

      ctx.query.location
        ? location = locations.find(({ id }) => id === Number(ctx.query.location))
        : location = {
          id: 290,
          name: '北京',
        };

      const movieDetail = await app.curl('https://ticket-api-m.mtime.cn/movie/detail.api?locationId=' + ctx.query.location + '&movieId=' + ctx.params.movieId, {
        dataType: 'json',
      }).then(res => res.data.data);

      const videoData = await app.curl('https://api-m.mtime.cn/Movie/Video.api?pageIndex=1&movieId=' + ctx.params.movieId, {
        dataType: 'json',
      }).then(res => res.data);

      await ctx.render('page/video.tpl', { location, locations, movieDetail, videoData, ctx });
    }
  }
  return VideoController;
};

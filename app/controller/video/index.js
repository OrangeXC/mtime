'use strict';

module.exports = app => {
  class VideoController extends app.Controller {
    async index(ctx) {
      const movieId = ctx.params.movieId;
      const { location, locations } = await ctx.helper.getLocation(ctx);

      const movieDetail = await app.curl(`https://ticket-api-m.mtime.cn/movie/detail.api?locationId=${location.id}&movieId=${movieId}`, {
        dataType: 'json',
      }).then(res => res.data.data);

      const videoData = await app.curl(`https://api-m.mtime.cn/Movie/Video.api?pageIndex=1&movieId=${movieId}`, {
        dataType: 'json',
      }).then(res => res.data);

      await ctx.render('page/video.tpl', { location, locations, movieDetail, videoData, movieId });
    }
  }
  return VideoController;
};

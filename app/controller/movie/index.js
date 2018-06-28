'use strict';

module.exports = app => {
  class MovieController extends app.Controller {
    async index(ctx) {
      const id = ctx.params.id;
      const { location, locations } = await ctx.helper.getLocation(ctx);

      const movieDetail = await app.curl(`https://ticket-api-m.mtime.cn/movie/detail.api?locationId=${location.id}&movieId=${id}`, {
        dataType: 'json',
      }).then(res => res.data.data);

      const movieComment = await app.curl(`https://ticket-api-m.mtime.cn/movie/hotComment.api?movieId=${id}`, {
        dataType: 'json',
      }).then(res => res.data.data);

      const movieImages = await app.curl(`https://api-m.mtime.cn/Movie/ImageAll.api?movieId=${id}`, {
        dataType: 'json',
      }).then(res => res.data.images.splice(0, 10));

      await ctx.render('page/movie.tpl', { location, locations, movieDetail, movieComment, movieImages, id });
    }
  }
  return MovieController;
};

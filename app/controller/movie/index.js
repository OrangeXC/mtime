'use strict';

module.exports = app => {
  class MovieController extends app.Controller {
    async index(ctx) {
      const locations = await ctx.model.Location.findAll();

      let location;

      ctx.query.location
        ? location = locations.find(({ id }) => id === Number(ctx.query.location))
        : location = {
          id: 290,
          name: '北京',
        };

      const movieDetail = await app.curl('https://ticket-api-m.mtime.cn/movie/detail.api?locationId=' + ctx.query.location + '&movieId=' + ctx.params.id, {
        dataType: 'json',
      }).then(res => res.data.data);

      const movieComment = await app.curl('https://ticket-api-m.mtime.cn/movie/hotComment.api?movieId=' + ctx.params.id, {
        dataType: 'json',
      }).then(res => res.data.data);

      const movieImages = await app.curl('https://api-m.mtime.cn/Movie/ImageAll.api?movieId=' + ctx.params.id, {
        dataType: 'json',
      }).then(res => res.data.images.splice(0, 10));

      await ctx.render('page/movie.tpl', { location, locations, movieDetail, movieComment, movieImages, ctx });
    }
  }
  return MovieController;
};

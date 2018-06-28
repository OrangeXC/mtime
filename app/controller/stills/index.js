'use strict';

module.exports = app => {
  class StillsController extends app.Controller {
    async index(ctx) {
      const movieId = ctx.params.movieId;
      const { location, locations } = await ctx.helper.getLocation(ctx);

      const movieDetail = await app.curl(`https://ticket-api-m.mtime.cn/movie/detail.api?locationId=${location.id}&movieId=${movieId}`, {
        dataType: 'json',
      }).then(res => res.data.data);

      const stills = await app.curl(`https://api-m.mtime.cn/Movie/ImageAll.api?movieId=${movieId}`, {
        dataType: 'json',
      }).then(res => res.data.images.map(item => {
        item.sImage = item.image.replace('1000X1000', '200X200');

        return item;
      }));

      await ctx.render('page/stills.tpl', { location, locations, movieDetail, stills, movieId });
    }
  }
  return StillsController;
};

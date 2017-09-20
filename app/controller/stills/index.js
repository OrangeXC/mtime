'use strict';

module.exports = app => {
  class StillsController extends app.Controller {
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

      const stills = await app.curl('https://api-m.mtime.cn/Movie/ImageAll.api?movieId=' + ctx.params.movieId, {
        dataType: 'json',
      }).then(res => res.data.images.map(item => {
        item.sImage = item.image.replace('1000X1000', '200X200');

        return item;
      }));

      await ctx.render('page/stills.tpl', { location, locations, movieDetail, stills, ctx });
    }
  }
  return StillsController;
};

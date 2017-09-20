'use strict';

module.exports = app => {
  class HotController extends app.Controller {
    async index(ctx) {
      const locations = await ctx.model.Location.findAll();

      let location;

      ctx.query.location
        ? location = locations.find(({ id }) => id === Number(ctx.query.location))
        : location = {
          id: 290,
          name: '北京',
        };

      const locationMovies = await app.curl('https://api-m.mtime.cn/Showtime/LocationMovies.api?locationId=' + location.id, {
        dataType: 'json',
      }).then(res => res.data);

      await ctx.render('page/hot.tpl', { location, locations, locationMovies });
    }
  }
  return HotController;
};

'use strict';

module.exports = app => {
  class HotController extends app.Controller {
    async index(ctx) {
      const { location, locations } = await ctx.helper.getLocation(ctx);

      const locationMovies = await app.curl(`https://api-m.mtime.cn/Showtime/LocationMovies.api?locationId=${location.id}`, {
        dataType: 'json',
      }).then(res => res.data);

      await ctx.render('page/hot.tpl', { location, locations, locationMovies });
    }
  }
  return HotController;
};

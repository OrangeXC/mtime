'use strict';

module.exports = app => {
  class HomeController extends app.Controller {
    async index(ctx) {
      const { location, locations } = await ctx.helper.getLocation(ctx);

      const hotPlayMovies = await app.curl(`https://api-m.mtime.cn/PageSubArea/HotPlayMovies.api?locationId=${location.id}`, {
        dataType: 'json',
      }).then(res => res.data);

      await ctx.render('page/home.tpl', { location, locations, hotPlayMovies });
    }
  }

  return HomeController;
};

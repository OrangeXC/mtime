'use strict';

module.exports = app => {
  class NewController extends app.Controller {
    async index(ctx) {
      const { location, locations } = await ctx.helper.getLocation(ctx);

      const movieComingNew = await app.curl(`https://api-m.mtime.cn/Movie/MovieComingNew.api?locationId=${location.id}`, {
        dataType: 'json',
      }).then(res => res.data);

      await ctx.render('page/new.tpl', { location, locations, movieComingNew });
    }
  }
  return NewController;
};

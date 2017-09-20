'use strict';

module.exports = app => {
  class NewController extends app.Controller {
    async index(ctx) {
      const locations = await ctx.model.Location.findAll();

      let location;

      ctx.query.location
        ? location = locations.find(({ id }) => id === Number(ctx.query.location))
        : location = {
          id: 290,
          name: '北京',
        };

      const movieComingNew = await app.curl('https://api-m.mtime.cn/Movie/MovieComingNew.api?locationId=' + location.id, {
        dataType: 'json',
      }).then(res => res.data);

      await ctx.render('page/new.tpl', { location, locations, movieComingNew });
    }
  }
  return NewController;
};

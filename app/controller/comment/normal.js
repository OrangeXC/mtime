'use strict';

module.exports = app => {
  class CommentController extends app.Controller {
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

      const page = ctx.query.page || 1;

      const comments = await app.curl('https://api-m.mtime.cn/Showtime/HotMovieComments.api?pageIndex=' + page + '&movieId=' + ctx.params.movieId, {
        dataType: 'json',
      }).then(res => res.data.data);

      const currentPage = Number(ctx.query.page);
      const pages = [];

      for (let i = 1; i < comments.tpc + 1; i++) {
        pages.push(i);
      }

      await ctx.render('page/comment.tpl', { location, locations, movieDetail, comments, pages, currentPage, ctx });
    }
  }
  return CommentController;
};

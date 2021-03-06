'use strict';

module.exports = app => {
  class HotCommentController extends app.Controller {
    async index(ctx) {
      const movieId = ctx.params.movieId;
      const { location, locations } = await ctx.helper.getLocation(ctx);

      const movieDetail = await app.curl(`https://ticket-api-m.mtime.cn/movie/detail.api?locationId=${location.id}&movieId=${movieId}`, {
        dataType: 'json',
      }).then(res => res.data.data);

      const page = ctx.query.page || 1;

      const comments = await app.curl(`https://api-m.mtime.cn/Movie/HotLongComments.api?pageIndex=${page}&movieId=${movieId}`, {
        dataType: 'json',
      }).then(res => res.data);

      const currentPage = Number(ctx.query.page);
      const pageLength = Math.ceil(comments.totalCount / 20);
      const pages = [];

      for (let i = 1; i < pageLength + 1; i++) {
        pages.push(i);
      }

      await ctx.render('page/hotComment.tpl', { location, locations, movieDetail, comments, pages, currentPage, movieId });
    }
  }
  return HotCommentController;
};

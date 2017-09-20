'use strict';

module.exports = app => {
  class VideoProxyController extends app.Controller {
    async index(ctx) {
      console.log(ctx.query.url);
      return await app.curl(ctx.query.url).then(res => {
        console.log(res.data.length);
      });
    }
  }
  return VideoProxyController;
};

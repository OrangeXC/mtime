'use strict';

module.exports = app => {
  app.get('/', 'home.index');
  app.get('/hot', 'hot.index.index');
  app.get('/new', 'new.index.index');
  app.get('/movie/:id', 'movie.index.index');
  app.get('/comment/:movieId', 'comment.normal.index');
  app.get('/hot_comment/:movieId', 'comment.hot.index');
  app.get('/stills/:movieId', 'stills.index.index');
  app.get('/video/:movieId', 'video.index.index');
};

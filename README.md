<p align="center"><img width="100" src="https://i.loli.net/2019/09/03/2CvEaFV8KS73GQt.png" alt="mtime logo"></p>

<p align="center">
  <a href="https://travis-ci.com/OrangeXC/mtime"><img src="https://travis-ci.com/OrangeXC/mtime.svg?branch=master" alt="Build Status"></a>
  <a href="https://github.com/OrangeXC/mtime/blob/master/LICENSE"><img src="https://img.shields.io/github/license/orangexc/mtime" alt="GitHub License"></a>
</p>

## Introduction

A MVC mTime websit build with eggjs

## Features

* [Egg](https://eggjs.org/)
* [MySql](https://www.mysql.com/)
* [Nunjucks](https://mozilla.github.io/nunjucks/)
* [Bulma](http://bulma.io/)
* [lightgallery](http://sachinchoolur.github.io/lightGallery/)

## Pages

* All chinese location change
* Movie list(hot, new and comming)
* Movie detail
* Movie trailer
* Movie stills
* Movie lang comment
* Movie mini comment

## Development

config your mysql at `config/config.default.js`, then

```bash
$ yarn
$ yarn dev
$ open http://localhost:7001
```

## Deploy

```bash
$ yarn start
$ yarn stop
```

## Npm scripts

- Use `yarn lint` to check code style.
- Use `yarn test` to run unit test.
- Use `yarn autod` to auto detect dependencies upgrade, see [autod](https://www.npmjs.com/package/autod) for more detail.

## License

Mtime is [MIT licensed](https://github.com/OrangeXC/mtime/blob/master/LICENSE).

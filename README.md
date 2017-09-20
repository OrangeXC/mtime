# MTime

> A MVC mTime websit build with egg

![](http://ovsd4kmal.bkt.clouddn.com/Fv8I13LnvNqGFXDJIBgtc7sjOip6.png)

### features

* All chinese location change
* Movie list(hot, new and comming)
* Movie detail
* Movie trailer
* Movie stills
* Movie lang comment
* Movie mini comment

### tech

* [Egg](https://eggjs.org/)
* [MySql](https://www.mysql.com/)
* [Nunjucks](https://mozilla.github.io/nunjucks/)
* [Bulma](http://bulma.io/)
* [lightgallery](http://sachinchoolur.github.io/lightGallery/)

### Development

config your mysql at `config/config.default.js`, then

```bash
$ npm i
$ npm run dev
$ open http://localhost:7001
```

### Deploy

```bash
$ npm start
$ npm stop
```

### npm scripts

- Use `npm run lint` to check code style.
- Use `npm test` to run unit test.
- Use `npm run autod` to auto detect dependencies upgrade, see [autod](https://www.npmjs.com/package/autod) for more detail.

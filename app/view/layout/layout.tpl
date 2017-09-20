<!doctype html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <title>{% block title %}egg{% endblock %}</title>
    <link href="https://cdn.bootcss.com/bulma/0.5.1/css/bulma.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/lightgallery/1.6.0/css/lightgallery.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/video.js/6.2.8/video-js.min.css" rel="stylesheet">
    <link href="/public/favicon.png" rel="icon" type="image/x-icon">
    <link href="/public/css/main.css" rel="stylesheet">
  </head>
  <body>
    {% include "./header.tpl" %}
    {% block content %}{% endblock %}
    {% include "./footer.tpl" %}
    {% include "./script.tpl" %}
  </body>
</html>

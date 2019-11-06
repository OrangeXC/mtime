<!doctype html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <title>{% block title %}mtime{% endblock %}</title>
    <link href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/lightgallery@1.6.12/dist/css/lightgallery.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/video.js@7.6.5/dist/video-js.min.css" rel="stylesheet">
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

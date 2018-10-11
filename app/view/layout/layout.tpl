<!doctype html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <title>{% block title %}mtime{% endblock %}</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.1/css/bulma.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/lightgallery/1.6.11/css/lightgallery.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/video.js/7.2.4/video-js.min.css" rel="stylesheet">
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

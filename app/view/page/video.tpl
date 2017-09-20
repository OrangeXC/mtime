{% extends "../layout/layout.tpl" %}

{% block content %}
  <div class="container">
    <nav class="breadcrumb" aria-label="breadcrumbs">
      <ul>
        <li><a href="/?location={{ location.id }}"><span class="icon is-small"><i class="fa fa-home"></i></span><span>主页</span></a></li>
        <li><a href="/movie/{{ ctx.params.movieId }}?location={{ location.id }}"><span class="icon is-small"><i class="fa fa-film"></i></span><span>{{ movieDetail.basic.name }}</span></a></li>
        <li><a href="#"><span class="icon is-small"><i class="fa fa-video-camera"></i></span><span>拍摄花絮</span></a></li>
      </ul>
    </nav>
    <div class="content">
      <article class="message is-dark">
        <div class="message-header">
          <p>提示</p>
        </div>
        <div class="message-body">
          由于三方的 api 不支持跨域视频访问，想观看视频请到 <a href="http://movie.mtime.com/{{ ctx.params.movieId }}/trailer.html" target="_blank">http://movie.mtime.com/{{ ctx.params.movieId }}/trailer.html</a>
        </div>
      </article>
      {% for item in videoData.videoList %}
        <div style="display:none;" id="video{{ item.id }}">
          <video class="lg-video-object lg-html5 video-js vjs-default-skin" controls preload="none">
            <source src="{{ item.url }}" type="video/mp4">
            Your browser does not support HTML5 video.
          </video>
        </div>
      {% endfor %}

      <div id="video-gallery" class="columns is-multiline is-mobile">
        {% for item in videoData.videoList %}
          <div class="column is-3 video-item" data-poster="{{ item.image }}" data-sub-html="{{ item.title }}" data-html="#video{{ item.id }}">
            <img class="cover" src="{{ item.image }}" />
            <img class="play-btn" src="data:image/png;base64,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">
          </div>
        {% endfor %}
      </div>
    </div>
  </div>
{% endblock %}

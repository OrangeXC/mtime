{% extends "../layout/layout.tpl" %}

{% block content %}
  <div class="container">
    <nav class="breadcrumb" aria-label="breadcrumbs">
      <ul>
        <li><a href="/?location={{ location.id }}"><span class="icon is-small"><i class="fa fa-home"></i></span><span>主页</span></a></li>
        <li><a href="/movie/{{ ctx.params.movieId }}?location={{ location.id }}"><span class="icon is-small"><i class="fa fa-film"></i></span><span>{{ movieDetail.basic.name }}</span></a></li>
        <li><a href="#"><span class="icon is-small"><i class="fa fa-picture-o"></i></span><span>剧照</span></a></li>
      </ul>
    </nav>
    <div class="content">
      <div id="lightgallery">
        {% for item in stills %}
          <a href="{{ item.image }}">
            <img src="{{ item.sImage }}" />
          </a>
        {% endfor %}
      </div>
    </div>
  </div>
{% endblock %}

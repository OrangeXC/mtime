{% extends "../layout/layout.tpl" %}

{% block content %}
  <div class="container">
    <nav class="breadcrumb" aria-label="breadcrumbs">
      <ul>
        <li><a href="/?location={{ location.id }}"><span class="icon is-small"><i class="fa fa-home"></i></span><span>主页</span></a></li>
        <li><a href="/movie/{{ ctx.params.movieId }}?location={{ location.id }}"><span class="icon is-small"><i class="fa fa-film"></i></span><span>{{ movieDetail.basic.name }}</span></a></li>
        <li><a href="#"><span class="icon is-small"><i class="fa fa-comments-o"></i></span><span>全部热评</span></a></li>
      </ul>
    </nav>
    {% for item in comments.comments %}
      <div class="box">
        <article class="media">
          <div class="media-left">
            <figure class="image is-64x64">
              <img src="{{ item.headurl }}" alt="Image">
            </figure>
          </div>
          <div class="media-content">
            <div class="content">
              <p>
                <strong>{{ item.title }}</strong> <a>@{{ item.nickname }}</a>
                <br>
                {{ item.content }}
              </p>
            </div>
            <nav class="level is-mobile">
              <div class="level-left">
                {% if item.cal %}
                  <small class="level-item">
                    <span class="icon is-small"><i class="fa fa-map-marker"></i></span>{{ item.location }}
                  </small>
                {% endif %}
                <small class="level-item">
                  <span class="icon is-small"><i class="fa fa-reply"></i></span>{{ item.commentCount }}
                </small>
              </div>
            </nav>
          </div>
        </article>
      </div>
    {% endfor %}
    <nav class="pagination is-centered" role="navigation" aria-label="pagination">
      <ul class="pagination-list">
        {% for i in pages %}
          {% if i === currentPage %}
            <li><a class="pagination-link is-current">{{ i }}</a></li>
          {% else %}
            <li><a class="pagination-link" href="/hot_comment/{{ ctx.params.movieId }}?location={{ location.id }}&page={{ i }}">{{ i }}</a></li>
          {% endif %}
        {% endfor %}
      </ul>
    </nav>
  </div>
{% endblock %}

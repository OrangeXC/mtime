{% extends "../layout/layout.tpl" %}

{% block content %}
  <div class="container">
    <nav class="breadcrumb" aria-label="breadcrumbs">
      <ul>
        <li><a href="/?location={{ location.id }}"><span class="icon is-small"><i class="fa fa-home"></i></span><span>主页</span></a></li>
        <li><a href="/movie/{{ ctx.params.movieId }}?location={{ location.id }}"><span class="icon is-small"><i class="fa fa-film"></i></span><span>{{ movieDetail.basic.name }}</span></a></li>
        <li><a href="#"><span class="icon is-small"><i class="fa fa-comments-o"></i></span><span>全部短评</span></a></li>
      </ul>
    </nav>
    {% for item in comments.cts %}
      <div class="box">
        <article class="media">
          <div class="media-left">
            <figure class="image is-64x64">
              <img src="{{ item.caimg }}" alt="Image">
            </figure>
          </div>
          <div class="media-content">
            <div class="content">
              <p>
                <a>{{ item.ca }}</a>
                <br>
                {{ item.ce }}
              </p>
            </div>
            <nav class="level is-mobile">
              <div class="level-left">
                {% if item.cal %}
                  <small class="level-item">
                    <span class="icon is-small"><i class="fa fa-map-marker"></i></span>{{ item.cal }}
                  </small>
                {% endif %}
                <small class="level-item">
                  <span class="icon is-small"><i class="fa fa-reply"></i></span>{{ item.cr }}
                </small>
              </div>
            </nav>
          </div>
        </article>
      </div>
    {% endfor %}
    <nav class="pagination is-centered" role="navigation" aria-label="pagination">
      <ul class="pagination-list">
        {% if pages.length < 11 %}
          {% for i in pages %}
            {% if i === currentPage %}
              <li><a class="pagination-link is-current">{{ i }}</a></li>
            {% else %}
              <li><a class="pagination-link" href="/comment/{{ ctx.params.movieId }}?location={{ location.id }}&page={{ i }}">{{ i }}</a></li>
            {% endif %}
          {% endfor %}
        {% else %}
          {% if currentPage < 5 %}
            {% for i in [1, 2, 3, 4, 5] %}
              {% if i === currentPage %}
                <li><a class="pagination-link is-current">{{ i }}</a></li>
              {% else %}
                <li><a class="pagination-link">{{ i }}</a></li>
              {% endif %}
            {% endfor %}
            <li><span class="pagination-ellipsis">&hellip;</span></li>
            <li><a class="pagination-link">{{ pages.length }}</a></li>
          {% elif currentPage > pages.length - 3 %}
            <li><a class="pagination-link">1</a></li>
            <li><span class="pagination-ellipsis">&hellip;</span></li>
            {% for i in [pages.length - 4, pages.length - 3, pages.length - 2, pages.length - 1, pages.length] %}
              {% if i === currentPage %}
                <li><a class="pagination-link is-current">{{ i }}</a></li>
              {% else %}
                <li><a class="pagination-link">{{ i }}</a></li>
              {% endif %}
            {% endfor %}
          {% elif currentPage > 5 %}
            {% if currentPage < pages.length - 3 %}
              <li><a class="pagination-link">1</a></li>
              <li><span class="pagination-ellipsis">&hellip;</span></li>
              {% for i in [currentPage - 1, currentPage, currentPage + 1] %}
                {% if i === currentPage %}
                  <li><a class="pagination-link is-current">{{ i }}</a></li>
                {% else %}
                  <li><a class="pagination-link">{{ i }}</a></li>
                {% endif %}
              {% endfor %}
              <li><span class="pagination-ellipsis">&hellip;</span></li>
              <li><a class="pagination-link">{{ pages.length }}</a></li>
            {% endif %}
          {% endif %}
        {% endif %}
      </ul>
    </nav>
  </div>
{% endblock %}

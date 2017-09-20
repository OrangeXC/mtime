{% extends "../layout/layout.tpl" %}

{% block content %}
  <section class="hero">
    <div class="hero-body">
      <div class="container">
        <h1 class="title">
          正在售票
        </h1>
      </div>
    </div>
  </section>

  <div class="box">
    <div class="container">
      <nav class="level is-mobile">
        <div class="level-item has-text-centered">
          <div>
            <p class="heading">热门影片</p>
            <p class="title">{{ hotPlayMovies.count }}</p>
          </div>
        </div>
        <div class="level-item has-text-centered">
          <div>
            <p class="heading">同城影院数量</p>
            <p class="title">{{ hotPlayMovies.totalCinemaCount }}</p>
          </div>
        </div>
        <div class="level-item has-text-centered">
          <div>
            <p class="heading">即将上映</p>
            <p class="title">{{ hotPlayMovies.totalComingMovie }}</p>
          </div>
        </div>
        <div class="level-item has-text-centered">
          <div>
            <p class="heading">正在售票</p>
            <p class="title">{{ hotPlayMovies.totalHotMovie }}</p>
          </div>
        </div>
      </nav>
    </div>
  </div>

  <div class="container">
    <div class="columns is-multiline">
      {% for item in hotPlayMovies.movies %}
        <div class="column is-3">
          <a href="/movie/{{ item.movieId }}?location={{ location.id }}">
            <div class="card">
              <div class="card-image">
                <figure class="cover-image">
                  <img src="{{ item.img }}" alt="Image">
                </figure>
              </div>
              <div class="card-content">
                <div class="media">
                  <div class="media-content">
                    <p class="title is-4">{{ item.titleCn }}</p>
                    <p class="subtitle is-6">{{ item.titleEn }}</p>
                  </div>
                </div>

                <div class="content">
                  评分：<a>{{ item.ratingFinal }}</a> <small>({{ item.wantedCount }}人想看)</small><br>
                  {{ item.length }}分 {{ item.type }}<br>
                  导演：{{ item.directorName }}<br>
                  主演：{{ item.actorName1 }} / {{ item.actorName2 }}
                </div>
              </div>
            </div>
          </a>
        </div>
      {% endfor %}
    </div>
  </div>
{% endblock %}

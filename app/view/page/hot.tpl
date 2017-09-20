{% extends "../layout/layout.tpl" %}

{% block content %}
  <section class="hero">
    <div class="hero-body">
      <div class="container">
        <h1 class="title">
          正在热映
        </h1>
      </div>
    </div>
  </section>

  <div class="container">
    <div class="columns is-multiline">
      {% for item in locationMovies.ms %}
        <div class="column is-3">
          <a href="/movie/{{ item.id }}?location={{ location.id }}">
            <div class="card">
              <div class="card-image">
                <figure class="cover-image">
                  <img src="{{ item.img }}" alt="Image">
                </figure>
              </div>
              <div class="card-content">
                <div class="media">
                  <div class="media-content">
                    <p class="title is-4">{{ item.tCn }}</p>
                    <p class="subtitle is-6">{{ item.tEn }}</p>
                  </div>
                </div>

                <div class="content">
                  评分：<a>{{ item.r }}</a> <small>({{ item.wantedCount }}人想看)</small><br>
                  {{ item.d }}分 {{ item.type }}<br>
                  导演：{{ item.dN }}<br>
                  主演：{{ item.aN1 }} / {{ item.aN2 }}
                </div>
              </div>
            </div>
          </a>
        </div>
      {% endfor %}
    </div>
  </div>
{% endblock %}

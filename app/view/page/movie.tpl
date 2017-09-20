{% extends "../layout/layout.tpl" %}

{% block content %}
  <div class="container">
    <nav class="breadcrumb" aria-label="breadcrumbs">
      <ul>
        <li><a href="/?location={{ location.id }}"><span class="icon is-small"><i class="fa fa-home"></i></span><span>主页</span></a></li>
        <li><a href="#"><span class="icon is-small"><i class="fa fa-film"></i></span><span>{{ movieDetail.basic.name }}</span></a></li>
      </ul>
    </nav>
    <div class="box">
      <article class="media">
        <div class="media-left">
          <figure class="detail-cover">
            <img src="{{ movieDetail.basic.img }}" alt="Image">
          </figure>
        </div>
        <div class="media-content">
          <div class="content">
            <h2 class="title">{{ movieDetail.basic.name }}<small> ({{ movieDetail.basic.releaseDate | truncate(4, False, '', 0) }})</small></h2>
            <h3 class="subtitle">{{ movieDetail.basic.nameEn }}</h3>
            <p>导演：{{ movieDetail.basic.director.name }} <small>({{ movieDetail.basic.director.nameEn }})</small></p>
            <p>主演：{% for item in movieDetail.basic.actors %}{{ item.name }} / {% endfor %}</p>
            <p>类型：{{ movieDetail.basic.type | join(' / ') }}</p>
            <p>上映日期：{{ movieDetail.basic.releaseDate }}（{{ movieDetail.basic.releaseArea }}）</p>
            <p>片长：{{ movieDetail.basic.mins }}</p>
            <p>评分：{{ movieDetail.basic.overallRating }}</p>
          </div>
          <nav class="level is-mobile">
            <div class="level-left">
              <a class="level-item">
                <span class="icon is-small"><i class="fa fa-reply"></i></span>
              </a>
              <a class="level-item">
                <span class="icon is-small"><i class="fa fa-retweet"></i></span>
              </a>
              <a class="level-item">
                <span class="icon is-small"><i class="fa fa-heart"></i></span>
              </a>
            </div>
          </nav>
        </div>
      </article>
    </div>
    <h3 class="is-3">剧情简介</h3>
    <div class="content">
      <div class="box">
        {{ movieDetail.basic.story }}
      </div>
    </div>
    <h3 class="is-3">导演和演员</h3>
    <div class="content">
      <div class="columns is-multiline">
        <div class="column is-2">
          <div class="box actor-box">
            <div class="people-cover" style="background-image:url({{ movieDetail.basic.director.img }})">
            </div>
            <strong class="ellipsis">{{ movieDetail.basic.director.name }}</strong>
            <small>导演</small>
          </div>
        </div>
        {% for item in movieDetail.basic.actors %}
          <div class="column is-2">
            <div class="box actor-box">
              <div class="people-cover" style="background-image:url({{ item.img }})">
              </div>
              <span class="ellipsis">{{ item.name }}</span>
              <span class="ellipsis"><small>饰 {{ item.roleName }}</small></span>
            </div>
          </div>
        {% endfor %}
      </div>
    </div>
    <h3 class="is-3">短评预告片&拍摄花絮<a href="/video/{{ ctx.params.id }}?location={{ location.id }}"> <small>点击查看>></small></a></h3>
    <div class="content"></div>
    <h3 class="is-3">剧照<a href="/stills/{{ ctx.params.id }}?location={{ location.id }}"> <small>查看更多>></small></a></h3>
    <div class="content stills-wrap">
      {% for item in movieImages %}
        <img class="stills" src="{{ item.image }}" alt="image">
      {% endfor %}
    </div>
    <h3 class="is-3">精选影评（{{ movieComment.plus.total }}）<a href="/hot_comment/{{ ctx.params.id }}?location={{ location.id }}&page=1"><small>查看更多>></small></a></h3>
    {% for item in movieComment.plus.list %}
      <div class="box">
        <article class="media">
          <div class="media-left">
            <figure class="image is-64x64">
              <img src="{{ item.headImg }}" alt="Image">
            </figure>
          </div>
          <div class="media-content">
            <div class="content">
              <p>
                <small>@{{ item.nickname }}</small>
                <br>
                {{ item.content }}
              </p>
            </div>
            <nav class="level is-mobile">
              <div class="level-left">
                {% if item.locationName %}
                  <a class="level-item">
                    <span class="icon is-small"><i class="fa fa-map-marker"></i></span>{{ item.locationName }}
                  </a>
                {% endif %}
                <a class="level-item">
                  <span class="icon is-small"><i class="fa fa-reply"></i></span>{{ item.replyCount }}
                </a>
              </div>
            </nav>
          </div>
        </article>
      </div>
    {% endfor %}
    <h3 class="is-3">短评（{{ movieComment.mini.total }}）<a href="/comment/{{ ctx.params.id }}?location={{ location.id }}&page=1"><small>查看更多>></small></a></h3>
    {% for item in movieComment.mini.list %}
      <div class="box">
        <article class="media">
          <div class="media-left">
            <figure class="image is-64x64">
              <img src="{{ item.headImg }}" alt="Image">
            </figure>
          </div>
          <div class="media-content">
            <div class="content">
              <p>
                <small>@{{ item.nickname }}</small>
                <br>
                {{ item.content }}
              </p>
            </div>
            <nav class="level is-mobile">
              <div class="level-left">
                {% if item.locationName %}
                  <a class="level-item">
                    <span class="icon is-small"><i class="fa fa-map-marker"></i></span>{{ item.locationName }}
                  </a>
                {% endif %}
                <a class="level-item">
                  <span class="icon is-small"><i class="fa fa-reply"></i></span>{{ item.replyCount }}
                </a>
              </div>
            </nav>
          </div>
        </article>
      </div>
    {% endfor %}
  </div>
{% endblock %}

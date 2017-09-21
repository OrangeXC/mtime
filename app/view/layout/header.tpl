<div class="container">
  <nav class="navbar">
    <div class="navbar-brand">
      <a class="navbar-item" href="{{ window.location.href }}">
        <img src="../../public/favicon.png" alt="logo" width="28" height="28">
        <h1 class="title is-4">MTime</h1>
      </a>

      <div class="navbar-burger burger is-actice" data-target="navMenu">
        <span></span>
        <span></span>
        <span></span>
      </div>
    </div>
    <div class="navbar-menu" id="navMenu">
      <div class="navbar-start">
        <a class="navbar-item " href="/?location={{ location.id }}">
          正在售票
        </a>
        <a class="navbar-item " href="/hot?location={{ location.id }}">
          正在热映
        </a>
        <a class="navbar-item " href="/new?location={{ location.id }}">
          即将上映
        </a>
        <div class="navbar-item has-dropdown is-hoverable">
          <a class="navbar-link  is-active" href="#">
            {{ location.name }}
          </a>
          <div class="navbar-dropdown ">
            {% for item in locations %}
              <a href="{{ window.location.origin }}{{ window.location.pathname }}?location={{ item.id }}" class="dropdown-item">
                {{ item.name }}
              </a>
            {% endfor %}
          </div>
        </div>
      </div>

      <div class="navbar-end">
        <a class="navbar-item is-hidden-desktop-only" href="https://github.com/OrangeXC/mtime" target="_blank">
          <span class="icon" style="color: #333;">
            <i class="fa fa-github"></i>
          </span>
        </a>
      </div>
    </div>
  </nav>
</div>

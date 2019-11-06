'use strict';

document.addEventListener('DOMContentLoaded', function() {

  // Get all "navbar-burger" elements
  const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

  // Check if there are any nav burgers
  if ($navbarBurgers.length > 0) {

    // Add a click event on each of them
    $navbarBurgers.forEach(function($el) {
      $el.addEventListener('click', function() {

        // Get the target from the "data-target" attribute
        const target = $el.dataset.target;
        const $target = document.getElementById(target);

        // Toggle the class on both the "navbar-burger" and the "navbar-menu"
        $el.classList.toggle('is-active');
        $target.classList.toggle('is-active');
      });
    });
  }
});

(function($) {
  $(function() {
    $('.navbar-item__link').each(function() {
      if ($(this).attr('href') === window.location.pathname) {
        $(this).addClass('is-active');
      }
    });

    $('#lightgallery').lightGallery({
      thumbnail: true,
    });

    $('#video-gallery').lightGallery({
      videojs: true,
    });
  });
})(window.jQuery);

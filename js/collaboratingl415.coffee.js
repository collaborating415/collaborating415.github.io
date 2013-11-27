(function() {
  "use strict";
  $('.js-btn-bio').on('click', function() {
    var box, id;
    id = this.getAttribute('data-id');
    box = $('#' + id);
    if (box.getAttribute('data-state') === 'expanded') {
      box.setAttribute('data-state', 'collapsed');
      return this.setAttribute('data-state', 'collapsed');
    } else {
      box.setAttribute('data-state', 'expanded');
      return this.setAttribute('data-state', 'expanded');
    }
  });

}).call(this);

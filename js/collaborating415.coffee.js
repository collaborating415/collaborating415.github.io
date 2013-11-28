(function() {
  "use strict";
  $('.js-expandable').on('click', function() {
    var box, btnTextCollapse, btnTextExpand, id;
    id = this.getAttribute('data-id');
    box = $('#' + id);
    btnTextExpand = this.getAttribute('data-title-expand');
    btnTextCollapse = this.getAttribute('data-title-collapse');
    if (box.getAttribute('data-state') === 'expanded') {
      box.setAttribute('data-state', 'collapsed');
      this.setAttribute('data-state', 'collapsed');
      return this.innerHTML = btnTextExpand;
    } else {
      box.setAttribute('data-state', 'expanded');
      this.setAttribute('data-state', 'expanded');
      return this.innerHTML = btnTextCollapse;
    }
  });

}).call(this);

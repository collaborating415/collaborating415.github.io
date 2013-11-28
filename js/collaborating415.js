/**! remy/min.js --> https://github.com/remy/min.js **/
$=function(t,n,e){var i=Node.prototype,r=NodeList.prototype,o="forEach",u="trigger",c=[][o],s=t.createElement("i");return r[o]=c,n.on=i.on=function(t,n){return this.addEventListener(t,n,!1),this},r.on=function(t,n){return this[o](function(e){e.on(t,n)}),this},n[u]=i[u]=function(n,e){var i=t.createEvent("HTMLEvents");return i.initEvent(n,!0,!0),i.data=e||{},i.eventName=n,i.target=this,this.dispatchEvent(i),this},r[u]=function(t){return this[o](function(n){n[u](t)}),this},e=function(n){var e=t.querySelectorAll(n||"☺"),i=e.length;return 1==i?e[0]:e},e.on=i.on.bind(s),e[u]=i[u].bind(s),e}(document,this);

(function() {
  "use strict";
  $('.js-btn-bio').on('click', function() {
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

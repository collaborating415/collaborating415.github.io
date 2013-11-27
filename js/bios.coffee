"use strict"

$('.js-btn-bio').on 'click', () ->
  id = @.getAttribute('data-id')
  box = $('#' + id)

  if box.getAttribute('data-state') is 'expanded'
    box.setAttribute('data-state', 'collapsed')
    @.setAttribute('data-state', 'collapsed')
  else
    box.setAttribute('data-state', 'expanded')
    @.setAttribute('data-state', 'expanded')

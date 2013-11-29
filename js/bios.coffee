"use strict"

correctEvent = if Modernizr.touch then 'touchstart' else 'click'

$('.js-expandable').on correctEvent, () ->
  id = @.getAttribute('data-id')
  box = $('#' + id)
  btnTextExpand = @.getAttribute('data-title-expand')
  btnTextCollapse = @.getAttribute('data-title-collapse')

  if box.getAttribute('data-state') is 'expanded'
    box.setAttribute('data-state', 'collapsed')
    @.setAttribute('data-state', 'collapsed')
    @.innerHTML = btnTextExpand
  else
    box.setAttribute('data-state', 'expanded')
    @.setAttribute('data-state', 'expanded')
    @.innerHTML = btnTextCollapse

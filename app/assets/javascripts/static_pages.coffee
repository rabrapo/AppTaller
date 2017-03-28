initialize = ->
  $('#static_pages_active').click ->
    alert @checked
    return
  return

$(document).ready initialize
$(document).on 'page:load', initialize

$ ->
  $('#pincha').on 'click', ->
    $('#pincha').addClass 'animated shake'
    $('#pincha').one 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', ->
      $('#pincha').removeClass 'animated shake'
      return
    return
  return

$ ->
  $('#pinchar').on 'click', ->
    $('#pinchar').addClass 'animated rubberBand'
    $('#pinchar').one 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', ->
      $('#pinchar').removeClass 'animated rubberBand'
      return
    return
  return

$ ->
  $('#entrar').on 'click', ->
    
  return

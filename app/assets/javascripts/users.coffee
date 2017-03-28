# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document.body).off 'click', 'nav.pagination a'
  $(document.body).on 'click', 'nav.pagination a', (e) ->
    e.preventDefault()
    loadingHTML = '<div class=\'loading\'>Loading...</div>'
    $('#users_container').html(loadingHTML).load $(this).attr('href')
    false
  return

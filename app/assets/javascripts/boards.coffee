# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $('#boards-container').masonry({
    itemSelector: '.board',
    gutterWidth: 10
  })
$(document).ready(ready)
$(document).on('page:load', ready)
$(window).load(ready)
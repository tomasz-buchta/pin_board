ready = ->
  container = $('#boards-container')
  container.imagesLoaded(->
    container.masonry({
      itemSelector: '.board',
      gutterWidth: 10
    })
  )

$(document).ready(ready)
$(document).on('page:load', ready)

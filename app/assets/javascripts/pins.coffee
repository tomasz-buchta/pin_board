ready = ->
  container = $('#pins-container')

  container.imagesLoaded(->
    container.masonry({
      itemSelector: '.pin',
      gutterWidth: 10
    })
  )

  container.infinitescroll({
      navSelector: '.pagination'
      nextSelector: '.pagination a.next_page'
      itemSelector: '.pin'
  },
  (newElements)->
    newElems = $(newElements).css({opacity: 0});
    newElems.imagesLoaded(
      ->
        newElems.animate({opacity: 1})
        container.masonry('appended',newElems,true)
    )
  )
$(document).ready(ready);
$(document).on('page:load', ready);
$(window).load(ready)
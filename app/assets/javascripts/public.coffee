window.addEventListener 'keydown', (e) -> 
  login = (e.ctrlKey || e.metaKey) && e.keyCode == 76
  if login
    if document.cookie.indexOf('logged_in=true')
      window.location = '/admin'
    else
      $('.navbar-inverse').slideToggle('fast')

$(document).ready ->
  $('ul.balls li').click ->
    window.location = $(this).children('a').attr('href')

  
  $('.portfolio img').each ->
    $(this).wrap('<a class="color-box" href="' + $(this).attr('src') + '" rel="group" data-colorbox_static="true" colorbox-photo="true" colorbox-iframe="false"></a>')

  $('.color-box').colorbox(
    rel: 'group'
    transition: 'elastic'
    )

  $('.nav-toggle').on 'click', ->
    $('ul.balls').slideToggle(300)
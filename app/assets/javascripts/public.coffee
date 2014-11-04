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


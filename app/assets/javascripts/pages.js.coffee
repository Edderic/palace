# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
 
$ ->  
  $(".start").click (e) ->
    e.preventDefault()
    gc = new GameController(2, Player.ONE)

    $(this).hide()

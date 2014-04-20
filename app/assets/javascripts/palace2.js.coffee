window.Palace2 =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
    new @Routers.Games
    Backbone.history.start(pushState: true)

window.App = window.Palace2
$(document).ready ->
  Palace2.initialize()

class Palace2.Routers.Games extends Backbone.Router

  routes:
    '': 'gameStart'

  gameStart: ->
    view = new App.Views.GamesStart()
    $('#container').replaceWith(view.render().el)

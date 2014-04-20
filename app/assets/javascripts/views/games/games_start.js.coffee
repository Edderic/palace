class Palace2.Views.GamesStart extends Backbone.View

  id: 'container'

  template: JST['games/start']

  events:
    'click #start-btn': 'startGame' 

  render: ->
    @$el.html(@template())
    this

  startGame: ->
    view = new App.Views.GamesStarted()

    @$el.html(view.render().el)
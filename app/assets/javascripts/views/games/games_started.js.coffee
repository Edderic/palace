class Palace2.Views.GamesStarted extends Backbone.View

  id: 'container'

  template: JST['games/started']

  initialize: ->
    game = new Palace2.Models.Game()

  render: ->
    $('#container').replaceWith(@template())
    @render_cards_of_player(1)
    @render_cards_of_player(2)
    @render_cards_of_new_and_used_deck()
    this

  render_cards_of_player: (index)  ->
    _(3).times ->
      $("#player_#{index} .last.face_down.deck").append("<div class='card' orientation='face-down'></div>")
      $("#player_#{index} .last.face_up.deck").append("<div class='card'></div>")
      $("#player_#{index} .hand.deck").append("<div class='card'></div>")

  render_cards_of_new_and_used_deck: ->
    _(34).times ->
      $('.new.face_down.deck').append("<div class='card' orientation='face-down'></div>")
    

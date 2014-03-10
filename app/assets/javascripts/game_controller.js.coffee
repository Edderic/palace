###
  The glue between the game view and the model.
  gc = new GameController(2)
###

class @GameController
  constructor: (num_of_players, @who_am_i) ->
    if num_of_players isnt 2
      console.log "#{this}: num_of_players need to be two" 
      num_of_players = 2

    @game = new Game(num_of_players)

    GameView.init_player_decks(@game, @who_am_i)
    GameView.init_html_common()



#    @who_am_i = if Math.round(Math.random()) then "PLAYER_ONE" else "PLAYER_TWO"

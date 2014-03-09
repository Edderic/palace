###
  The glue between the game view and the model.
###

class @GameController
  @create: (num_of_players) ->
    if num_of_players isnt 2
      console.log "#{this}: num_of_players need to be two" 

      num_of_players = 2
      
    game = new Game(num_of_players)
    GameView.init_player_decks(game)
    GameView.init_html_common()

    return game

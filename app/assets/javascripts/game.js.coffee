class @Game
  constructor: (@num_of_players)->
    @status = "STARTED"
    @used_deck = []
    @new_deck = Card.new_deck()
    @constructor.initialize_html()


  @initialize_html: ->  
    $('.game-area').append(Game.html_player_one_last_face_down)
    $('.game-area').append(Game.html_player_one_last_face_up)
    $('.game-area').append(Game.html_player_one_hand)
    $('.game-area').append(Game.html_used_deck)
    $('.game-area').append(Game.html_new_deck)
    $('.game-area').append(Game.html_player_two_last_face_down)
    $('.game-area').append(Game.html_player_two_last_face_up)
    $('.game-area').append(Game.html_player_two_hand)

  @html_player_one_last_face_down:
    '<div class="player_one last face_down"></div>'

  @html_player_one_last_face_up: 
    '<div class="player_one last face_up"></div>'

  @html_player_one_hand:
    '<div class="player_one hand face_up_for_player_one face_down_for_player_two"></div>'

  @html_player_two_last_face_down:
    '<div class="player_two last face_down"></div>'

  @html_player_two_last_face_up:
    '<div class="player_two last face_up"></div>' 

  @html_player_two_hand:
    '<div class="player_two hand face_up_for_player_two face_down_for_player_one"></div>' 

  @html_used_deck:
    '<div class="used face_up"></div>'

  @html_new_deck:
    '<div class="new face_down"></div>'


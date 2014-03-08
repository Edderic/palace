class @Game
  constructor: (@num_of_players)->
    @status = "STARTED"
    @used_deck = []
    @new_deck = []

    @player_one_last_facedown_cards = []
    @player_one_last_faceup_cards = []
    @player_one_hand_cards = []
    @player_two_last_facedown_cards = []
    @player_two_last_faceup_cards = []
    @player_two_hand_cards = []  

    @distribute_cards()
    @constructor.initialize_html()

  distribute_cards: ->
    new_deck = Card.new_deck()

    for i in [0..2]
      @player_one_last_facedown_cards.push(new_deck.pop())
      @player_one_last_faceup_cards.push(new_deck.pop())
      @player_one_hand_cards.push(new_deck.pop())

      @player_two_last_facedown_cards.push(new_deck.pop())
      @player_two_last_faceup_cards.push(new_deck.pop())
      @player_two_hand_cards.push(new_deck.pop())

      @new_deck = new_deck
      
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


### 
  Separate Model, View, and Controller-related code.
  Encapsulate classes to simulate private methods and
  keep public stuff public.
###

class @Game
  constructor: (@num_of_players)->
    @status = "STARTED"
    @player = []
    @used_deck = []
    @new_deck = Card.new_deck()

    for idx in [0...@num_of_players]
      @player.push(new Player())

      @distribute_cards(idx)
      @initialize_html_player(idx)

    @init_html_common()

  distribute_cards: (idx) ->

    for card_idx in [0..2]
      @player[idx].last_facedown_cards.push(@new_deck.pop())
      @player[idx].last_faceup_cards.push(@new_deck.pop())
      @player[idx].hand_cards.push(@new_deck.pop())
  

  initialize_html_player: (idx) ->  
    name = switch
      when idx is 0 then 'one'
      when idx is 1 then 'two'
      else NaN

    # alert Game.html_last_face_down_player(name)
    $('.game-area').append(Game.html_last_face_down_player(name))
    $('.game-area').append(Game.html_last_face_up_player(name))
    $('.game-area').append(Game.html_hand_player(name))

    for card_idx in [0..2]
      card = @player[idx].last_faceup_cards[card_idx]
      faceup = "<div class='card' suit=\"#{card.suit}\" num=\"#{card.num}\"></div>"
      $(".player_#{name}.last.face_up").append faceup
      
      facedown = "<div class='card' suit=\"?\" num=\"?\"></div>"
      $(".player_#{name}.last.face_down").append facedown
  

  init_html_common: ->
    $('.game-area').append Game.html_used_deck
    $('.game-area').append Game.html_new_deck

  @html_last_face_down_player: (num_name) ->
    "<div class=\"player_#{num_name} last face_down\"></div>"

  @html_last_face_up_player: (num_name) -> 
    "<div class=\"player_#{num_name} last face_up\"></div>"

  @html_hand_player: (num_name) ->
    "<div class=\"player_#{num_name} hand face_up_for_player_one face_down_for_player_two\"></div>"

  @html_used_deck:
    '<div class="used face_up"></div>'

  @html_new_deck:
    '<div class="new face_down"></div>'


class @GameView
  @init_player_decks: (game) ->
    idx = game.player.length
    for player_idx in [0...game.player.length]

      name = switch
        when player_idx is 0 then 'one'
        when player_idx is 1 then 'two'
        else NaN

      $('.game-area').append(GameView.html_last_face_down_player(name))
      $('.game-area').append(GameView.html_last_face_up_player(name))
      $('.game-area').append(GameView.html_hand_player(name))

      for card_idx in [0..2]
        card = game.player[player_idx].last_faceup_cards[card_idx]
        faceup = "<div class='card' suit=\"#{card.suit}\" num=\"#{card.num}\"></div>"
        $(".player_#{name}.last.face_up").append faceup
        
        facedown = "<div class='card' suit=\"?\" num=\"?\"></div>"
        $(".player_#{name}.last.face_down").append facedown
  

  @init_html_common: ->
    $('.game-area').append GameView.html_used_deck
    $('.game-area').append GameView.html_new_deck

  @html_last_face_down_player: (num_name) ->
    "<div class=\"player_#{num_name} last face_down deck\"></div>"

  @html_last_face_up_player: (num_name) -> 
    "<div class=\"player_#{num_name} last face_up deck\"></div>"

  @html_hand_player: (num_name) ->
    "<div class=\"player_#{num_name} hand face_up_for_player_one face_down_for_player_two deck\"></div>"

  @html_used_deck:
    '<div class="used face_up"></div>'

  @html_new_deck:
    '<div class="new face_down"></div>'

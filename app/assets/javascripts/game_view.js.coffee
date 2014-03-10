###
  Seems like this class is concerned with the innards of players...
  Might be a good idea to move out these player specific ones to a player view class?
###

class @GameView
  @init_player_decks: (game, who_am_i) ->
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
        @init_last_faceup(name, card)
        @init_last_facedown(name,card)

        card_fu = game.player[player_idx].hand_cards[card_idx]
        @init_hand_deck(name, who_am_i, card_fu)
        

  @init_html_common: ->
    $('.game-area').append GameView.html_used_deck
    $('.game-area').append GameView.html_new_deck

  @init_last_faceup: (name, card) ->
    last_faceup = "<div class='card face_up' suit=\"#{card.suit}\" num=\"#{card.num}\"></div>"
    $(".player_#{name}.last.face_up").append last_faceup

  @init_last_facedown: (name, card) ->
    last_facedown = "<div class='card face_down' suit=\"?\" num=\"?\"></div>"
    $(".player_#{name}.last.face_down").append last_facedown

  @init_hand_deck: (name, who_am_i, card) ->

    if !name or !who_am_i or !card
      throw "#{this}: name: #{name}, who_am_i: #{who_am_i}, card: #{card}"

    card_details = ''
    facing = ''

    if who_am_i is Player.ONE and name is "one"
      facing = "face_up"
      card_details = " suit='#{card.suit}' num='#{card.num}'"
    else if who_am_i is Player.TWO and name is "one"
      facing = "face_down"
      card_details = " suit='?' num='?'"
    else if who_am_i is Player.ONE and name is "two"
      facing = "face_down"
      card_details = " suit='?' num='?'"
    else if who_am_i is Player.TWO and name is "two"
      facing = "face_up"
      card_details = " suit='#{card.suit}' 'num=#{card.num}'"


    $(".player_#{name}.hand.deck").append "<div#{card_details} class=\"card #{facing}\"></div>"

  @html_last_face_down_player: (num_name) ->
    "<div class=\"player_#{num_name} last face_down deck\"></div>"

  @html_last_face_up_player: (num_name) -> 
    "<div class=\"player_#{num_name} last face_up deck\"></div>"

  @html_hand_player: (num_name) ->
    "<div class=\"player_#{num_name} hand deck\"></div>"

  @html_used_deck:
    '<div class="used face_up"></div>'

  @html_new_deck:
    '<div class="new face_down"></div>'

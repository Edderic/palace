# Preconditions: 
#   args is composed of used_deck, new_deck, and players.  
#   They should be a collection.
#     they respond to #push, #pop.
#   used_deck should have no cards in it.
#
#   at least two players should exist in the players collection.
#   max num of players should be 4
#   min num of players is 2
#   all players cannot be computers
#   

# Invariant:
#   Sum of new_deck cards, used_deck cards, plus player_deck cards
#     is 52.
#   Each card is unique and belongs to the set of combination of
#     52 cards with suits [HEARTS,..., SPADES], and [A, 1, ... , Q, K]

# Postcondition:
#   Someone wins.  Either the computer or the player

class Palace2.Models.Game extends Backbone.Model
  initialize: (args) ->
    if !args
      throw 'No arguments passed in'
    # if !args.hasOwnProperty('used_deck')
    #   throw ', Used Deck has not been sent to game'
    if typeof args.used_deck.push isnt 'function' or typeof args.used_deck.pop isnt 'function'
      do throw 'used_deck doesn\'t respond to \'push\' or to \'pop\''
    if typeof args.new_deck.push isnt 'function' or typeof args.new_deck.pop isnt 'function'
      do throw 'new_deck doesn\'t respond to \'push\' or to \'pop\''
    if typeof args.players.push isnt 'function' or typeof args.players.pop isnt 'function'
      do throw 'players doesn\'t respond to \'push\' or to \'pop\''

    @used_deck = args.used_deck
    @new_deck = args.new_deck
    @players = args.players

    add_starting_card_to_used_deck(@used_deck, @new_deck)

    @players.each (player) =>
      hand_cards = player.get 'hand_cards'
      last_facedown_cards = player.get 'last_facedown_cards'
      last_faceup_cards = player.get 'last_faceup_cards'
      
      _(3).times (n) =>
        hand_cards.add @new_deck.pop()
        last_facedown_cards.add @new_deck.pop()
        last_faceup_cards.add @new_deck.pop()
     # = @players.models[0]
    # pop the new deck and put that card to the used deck

  num_players: ->
    @players.size()

  whose_turn_is_it: ->
    'PLAYER_1'

  status: ->
    'ONGOING'

  player_of_last_turn: ->
    'NONE'

  used_deck_top: ->
    @used_deck.last()

  # private

  add_starting_card_to_used_deck = (used_deck, new_deck) ->
    used_deck.push new_deck.pop()

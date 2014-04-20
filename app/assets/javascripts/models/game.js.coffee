class Palace2.Models.Game extends Backbone.Model
  initialize: (args) ->
    @used_deck = args.used_deck
    @new_deck = args.new_deck
    @players = args.players

  num_players: ->
    @players.size()

  whose_turn_is_it: ->
    'PLAYER_1'

  status: ->
    'ONGOING'

  used_deck_top: ->
    # {
    #   'suit': 'HEARTS'
    #   'num': '3'
    # }
    new Backbone.Model({'suit': 'HEARTS', 'num': '3'})
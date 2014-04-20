# Advantages: 
#   - Better Fault Isolation.
#     - Failure in other classes won't affect the tests here.
#
# Disadvantages:
#   - Tighter Coupling with implementation and spec.
#     - Classical style leads to just testing public interfaces, less about implementation details.
#       - Change in private methods are more likely to make tests fail. 
# Responsibilities of Game
# 

# Used private method to enable replacing real objects with fakes.
# Advantages: Enables us to stub out
# Disadvantages: getting locked into implementation.
describe 'Game, initialized with a collection of (2) players, a coll of used_cards and a coll of new_cards', ->
 

  beforeEach ->

    player1 = new Backbone.Model()
    player2 = new Backbone.Model()

    args = 
      'used_deck': new Backbone.Collection()
      'new_deck': new Backbone.Collection()
      'players': new Backbone.Collection([player1, player2]) 

    @game = new Palace2.Models.Game(args)

    @addMatchers 
      toBeIncludedIn: (arrayOfStuff) ->
        arrayOfStuff.find (card) =>
          jasmine.log card
          @actual.get('num') is card.get('num') and @actual.get('suit') is card.get('suit')
        
      toBeEitherPlayer: (players) ->
        @actual in players
         

  describe '#num_players()', ->
    it 'should return 2', ->
      expect(@game.num_players()).toBe 2

  describe '#whose_turn_is_it()', ->
    it 'should be either PLAYER_1 or PLAYER_2', ->
      expect(@game.whose_turn_is_it()).toBeEitherPlayer ['PLAYER_1','PLAYER_2']

  describe '#status()', ->
    it 'should return ONGOING', ->
      expect(@game.status()).toBe 'ONGOING'

  describe '#used_deck_top', ->
    it 'should return a CARD', ->
      legal_cards = ->
        suits = ['HEARTS', 'SPADES', 'DIAMONDS', 'CLUBS']
        nums = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']

        cards = new Backbone.Collection()

        for suit in suits
          for num in nums
            cards.add({'suit': suit, 'num': num})

        cards
      expect(@game.used_deck_top()).toBeIncludedIn legal_cards()


      # cards = @legal_cards()
      # bool = cards.find (card) ->
      #   console.log card
      #   @game.used_deck_top().num is card.get('num') and @game.used_deck_top().suit is card.get('suit')

      # expect(bool).toBeTruthy()

      # console.log 'hi'
      # expect(@game.used_deck_top()).toBeIncludedIn cards
      # you're testing the validity of the deck...
      # looks lik

  # describe '#is_last_move_legal()', ->
  # describe 'Say it is PLAYER_1\'s turn', ->
  #   beforeEach ->
  #     @whose_turn_stub = sinon.stub(@game, 'whose_turn_is_it')
  #       .returns 'PLAYER_1'

  #   afterEach ->
  #     @whose_turn_stub.restore()

  #   describe 'and PLAYER_1 makes a legal move', ->
  #     card =


  #     move = 
  #       player: 'PLAYER_1'
  #       deck: 'HAND'
  #       card: card
  #     game.attempt_move(move)

  #   describe 'and PLAYER_1 makes a bad move', ->
  #     game.attemot_move()

  #   describe 'but PLAYER_2 attempts to make a move', ->
  #     game.attempt_move() 
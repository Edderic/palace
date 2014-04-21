describe 'Game, initialized with a collection of (2) players, a coll of used_cards and a coll of new_cards', ->
  beforeEach ->
    @legal_cards = ->
      suits = ['HEARTS', 'SPADES', 'DIAMONDS', 'CLUBS']
      nums = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']

      cards = new Backbone.Collection()
      for suit in suits
        for num in nums
          cards.add({'suit': suit, 'num': num})
      cards

    @player1 = new Backbone.Model
      'hand_cards': new Backbone.Collection
      'last_facedown_cards': new Backbone.Collection
      'last_faceup_cards': new Backbone.Collection 
    @player2 = new Backbone.Model 
      'hand_cards': new Backbone.Collection
      'last_facedown_cards': new Backbone.Collection
      'last_faceup_cards': new Backbone.Collection
    @used_deck = new Backbone.Collection
    @new_deck = @legal_cards()
    @used_deck_push_spy = sinon.spy @used_deck, 'push'
    @new_deck_pop_spy = sinon.spy @new_deck, 'pop' 
    @players = new Backbone.Collection [@player1, @player2]

    @args = 
      'used_deck': @used_deck
      'new_deck': @new_deck
      'players': @players

    @game = new Palace2.Models.Game(@args)

    @addMatchers 
      toBeIncludedIn: (arrayOfStuff) ->
        arrayOfStuff.find (card) =>
          @actual.get('num') is card.get('num') and @actual.get('suit') is card.get('suit')
        
      toBeEitherPlayer: (players) ->
        @actual in players
         
  it 'should NOT throw an error', ->
    expect => new Palace2.Models.Game @args
      .not.toThrow()

  it 'should make #num_players return 2', ->
    expect @game.num_players()
      .toBe 2

  it 'should make #whose_turn_is_it return \'PLAYER_1\' or \'PLAYER_2\'', ->
    expect @game.whose_turn_is_it()
      .toBeEitherPlayer ['PLAYER_1','PLAYER_2']

  it 'should make #status return \'ONGOING\'', ->
    expect @game.status()
      .toBe 'ONGOING'

  it 'should make #used_deck_top return a legal card', ->
    expect @game.used_deck_top() 
      .toBeIncludedIn @legal_cards()

  it 'should make #player_of_last_turn return \'NONE\'', ->
    expect @game.player_of_last_turn()
      .toBe 'NONE'

  # it 'should have called \'push\' on used_deck once', ->
  #   expect @used_deck_push_spy
  #     .toHaveBeenCalledOnce()

  # it 'should have called \'pop\' on new_deck once', ->
  #   expect @new_deck_pop_spy
  #     .toHaveBeenCalledOnce()

  it 'should distribute 3 cards to each set of decks of PLAYER_1', ->
    first_player = @game.players.models[0]

    expect first_player.get('hand_cards').size()
      .toBe 3
    expect first_player.get('last_facedown_cards').size()
      .toBe 3
    expect first_player.get('last_faceup_cards').size()
      .toBe 3


  it 'should distribute 3 cards to each set of decks of PLAYER_2', ->
    second_player = @game.players.models[1]

    expect second_player.get('hand_cards').size()
      .toBe 3
    expect second_player.get('last_facedown_cards').size()
      .toBe 3
    expect second_player.get('last_faceup_cards').size()
      .toBe 3



  it 'should maintain invariant that all the cards should total 52 and exist in set of legal cards', ->
    # first_player = @game.players.models[0]
    # second_player = @game.players.models[1]

    # first_player_hand_cards = first_player.get('hand_cards')
    # first_player_lfd_cards = first_player.get('last_facedown_cards')
    # first_player_lfu_cards = first_player.get('last_faceup_cards')

    # first_player_cards_size = first_player_hand_cards.size() + 
    #                           first_player_lfd_cards.size() + 
    #                           first_player_lfu_cards.size()

    # second_player_hand_cards = second_player.get('hand_cards')
    # second_player_lfd_cards = second_player.get('last_facedown_cards')
    # second_player_lfu_cards = second_player.get('last_faceup_cards')

    # second_player_cards_size = second_player_hand_cards.size() + 
    #                           second_player_lfd_cards.size() + 
    #                           second_player_lfu_cards.size()

    # total_cards_size = @game.used_deck.size() + @game.new_deck.size() + first_player_cards_size + second_player_cards_size 
    

    types_of_deck_per_player = ['hand_cards', 'last_facedown_cards', 'last_faceup_cards']

    legal_cards = @legal_cards()
    card_count = 0
    @game.players.each (player) =>
      _.each types_of_deck_per_player, (type_of_deck) =>
        some_deck = player.get("#{type_of_deck}")
        some_deck.each (card) =>
          card_count++
          expect card
            .toBeIncludedIn legal_cards

    neutral_deck_type = ['used_deck', 'new_deck']
    _.each neutral_deck_type, (deck_type) =>
      a_deck = @game.get "#{deck_type}"
      a_deck.each (card) =>
        card_count++
        expect card
          .toBeIncludedIn legal_cards

    expect card_count
      .toBe 52 
  describe 'Stub the @used_deck last card to return 4 of DIAMONDS', ->
    beforeEach ->
      @four_of_dia = new Backbone.Model {'suit': 'DIAMONDS', 'num': '4'}
      @used_deck_stub = sinon.stub(@game.used_deck, 'last')
        .returns @four_of_dia

    afterEach ->
      @used_deck_stub.restore()

    it 'should make #used_deck_top return 4 of DIAMONDS card', ->
      expect(@game.used_deck_top()).toEqual @four_of_dia
  
  describe 'Stub #whose_turn_is_it to be PLAYER_2', ->
    beforeEach ->
      @wtii_stub = sinon.stub(@game, 'whose_turn_is_it').returns 'PLAYER_2'
    afterEach ->
      @wtii_stub.restore()

    it 'should make #whose_turn_is_it return \'PLAYER_2\'', ->
      expect(@game.whose_turn_is_it()).toEqual 'PLAYER_2' 

    describe 'Player_2 attempts a legal move', ->
      beforeEach ->
        # move = new Backbone.Model({'player':'PLAYER_1', 'card'})
        # move = {'player': 'PLAYER_2' 'card': { }}
        # @some_move = @game.attempt_move(move)
      it 'should make #attempt_move(legal_move) return \'LEGAL\'', ->
        # expect(@game.attempt_move()).toEqual 'LEGAL'
      it 'should make #status still be \'ONGOING\'', ->
      it 'should make #whose_turn_is_it return \'PLAYER_1\'', ->
      it 'should make #player_of_last_turn return \'PLAYER_2\'', ->

    describe 'Player_2 attemps an illegal move', ->
      it 'should make #attempt_move(legal_move) return \'LEGAL\'', ->
      it 'should make #status still be \'ONGOING\'', ->
      it 'should make #whose_turn_is_it still return \'PLAYER_2\'', ->
      it 'should make #player_of_last_turn return \'NONE\'', ->
      
    describe 'Player_1 attempts a move', ->
      it 'should make #attempt_move(illegal_move) return \'ILLEGAL\'', ->
      it 'should make #status still be \'ONGOING\'', ->
      it 'should make #whose_turn_is_it still return \'PLAYER_2\'', ->
      it 'should make #player_of_last_turn return \'NONE\'', ->

describe 'Bad arguments', ->
  describe 'empty args', ->
    it 'should throw \'No arguments passed in\'', ->
      expect -> new App.Models.Game
        .toThrow new Error 'No arguments passed in'

  describe 'undefined args', ->
    it 'should throw \'No arguments passed in\'', ->
      args = 
      expect -> new App.Models.Game args 
        .toThrow new Error 'No arguments passed in'

  describe 'bad used_deck', ->  
    describe 'used_deck doesn\'t respond to push or to pop', ->
      it 'should throw \'used_deck doesn\'t respond to \'push\'', ->
        bad_args =
          'used_deck': ''
          'new_deck': new Backbone.Collection
          'players': new Backbone.Collection

        expect -> new App.Models.Game bad_args
          .toThrow new Error 'used_deck doesn\'t respond to \'push\' or to \'pop\''

  describe 'bad new_deck', ->  
    describe 'new_deck doesn\'t respond to push or to pop', ->
      it 'should throw \'new_deck doesn\'t respond to \'push\'', ->
        bad_args =
          'new_deck': ''
          'used_deck': new Backbone.Collection
          'players': new Backbone.Collection

        expect -> new App.Models.Game bad_args
          .toThrow new Error 'new_deck doesn\'t respond to \'push\' or to \'pop\''

  describe 'bad players', ->  
    describe 'players doesn\'t respond to push or to pop', ->
      it 'should throw \'players doesn\'t respond to \'push\'', ->
        bad_args =
          'players': ''
          'new_deck': new Backbone.Collection
          'used_deck': new Backbone.Collection

        expect -> new App.Models.Game bad_args
          .toThrow new Error 'players doesn\'t respond to \'push\' or to \'pop\''



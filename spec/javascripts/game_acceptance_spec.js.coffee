###
  How do we decide how something is face up or down, 
  based on the view of the user.

  Solution: Starting the game should decide which player you should be.)
###

describe 'GameAcceptance', ->
  beforeEach ->
    loadFixtures 'game'

    @addMatchers
      toBePlayerOne: ->
        @actual is Player.ONE
      toBePlayerTwo: ->
        @actual is Player.TWO
  describe 'creating a new game with two players, you being PLAYER_ONE', ->
    beforeEach ->
      @gc = new GameController(2, Player.ONE)
    describe 'DOM', ->
      it 'should make used deck', ->
        expect($('.used').length).toBe 1

      it 'should make new deck', ->
        expect($('.new').length).toBe 1

      it 'should create three player one last facedown cards', ->
        expect($('.player_one.last.face_down.deck').children('.card').length).toBe 3

      it 'should create three player one last faceup cards', ->
        expect($('.player_one.last.face_up.deck').children('.card').length).toBe 3

      it 'should create three player one hand cards', ->
        expect($('.player_one.hand.deck').children('.card').length).toBe 3

      it 'should create three player two last facedown cards', ->
        expect($('.player_two.last.face_down.deck').children('.card').length).toBe 3

      it 'should create three player two last faceup cards', ->
        expect($('.player_two.last.face_up.deck').children('.card').length).toBe 3

      it 'should create three player two hand cards', ->
        expect($('.player_two.hand.deck').children('.card').length).toBe 3

      it 'should make user be player1 or player2', ->
        expect(@gc.who_am_i).toBePlayerOne()

      it 'should make player two hand cards to be face down', ->
        expect($('.player_two.hand.deck').children('.face_down').length).toBe 3

      it 'should make player one hand cards to be face up', ->
        expect($('.player_one.hand.deck').children('.face_up').length).toBe 3

      # describe 'the hand cards of player one', ->
      it 'should have num and suit attributes', ->
        $.each $('.player_one.hand.deck').children('.face_up'), (i,v) ->
          expect($(v).attr('suit')).not.toBeFalsy()


  describe 'creating a new game with two players, you being PLAYER_TWO', ->
    beforeEach ->
      @gc = new GameController(2, Player.TWO)

    describe 'DOM', ->
      it 'should make used deck', ->
        expect($('.used').length).toBe 1

      it 'should make new deck', ->
        expect($('.new').length).toBe 1

      it 'should create three player one last facedown cards', ->
        expect($('.player_one.last.face_down.deck').children('.card').length).toBe 3

      it 'should create three player one last faceup cards', ->
        expect($('.player_one.last.face_up.deck').children('.card').length).toBe 3

      it 'should create three player one hand cards', ->
        expect($('.player_one.hand.deck').children('.card').length).toBe 3

      it 'should create three player two last facedown cards', ->
        expect($('.player_two.last.face_down.deck').children('.card').length).toBe 3

      it 'should create three player two last faceup cards', ->
        expect($('.player_two.last.face_up.deck').children('.card').length).toBe 3

      it 'should create three player two hand cards', ->
        expect($('.player_two.hand.deck').children('.card').length).toBe 3

      it 'should make user be player1 or player2', ->
        expect(@gc.who_am_i).toBePlayerTwo()

      it 'should make player two hand cards to be face up', ->
        expect($('.player_two.hand.deck').children('.face_up').length).toBe 3

      it 'should make player one hand cards to be face down', ->
        expect($('.player_one.hand.deck').children('.face_down').length).toBe 3

      describe 'if user is PLAYER_ONE', ->
        beforeEach ->
          # @gc.who_am_i("PLAYER_ONE")

          # if @gc.who_am_i is "PLAYER_ONE"
            # player_two hand cards should be face down
            # player_one hand cards should be face up
          # else
            # player_two hand cards should be face up
            # player_one hand cards should be face down



  describe 'creating a new game with three players', ->
    beforeEach ->
      @gc = new GameController(3, Player.ONE)

    it 'should, for now, only create 2 players', ->
      expect(@gc.game.player.length).toBe 2

describe 'GameView', ->
  beforeEach ->
    loadFixtures 'game'

  describe 'creating a new game with two players', ->
    beforeEach ->
      GameController.create(2)

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

  describe 'creating a new game with three players', ->
    beforeEach ->
      @game = GameController.create(3)

    it 'should, for now, only create 2 players', ->
      expect(@game.player.length).toBe 2

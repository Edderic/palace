describe 'GameView', ->
  beforeEach ->
    loadFixtures 'game'

  describe 'creating a new game', ->
    beforeEach ->
      GameController.create(2)

    describe 'DOM', ->
      it 'should make used deck', ->
        expect($('.used').length).toBe 1

      it 'should make new deck', ->
        expect($('.new').length).toBe 1

      it 'should create three player one last facedown cards', ->
        expect($('.player_one.last.face_down').children('.card').length).toBe 3

      it 'should create three player one last faceup cards', ->
        expect($('.player_one.last.face_up').children('.card').length).toBe 3

      it 'should create three player one hand cards', ->
        expect($('.player_one.hand').children('.card').length).toBe 3

      it 'should create three player two last facedown cards', ->
        expect($('.player_two.last.face_down').children('.card').length).toBe 3

      it 'should create three player two last faceup cards', ->
        expect($('.player_two.last.face_up').children('.card').length).toBe 3

      it 'should create three player two hand cards', ->
        expect($('.player_two.hand').children('.card').length).toBe 3
describe 'Player', ->
  describe 'A new player', ->
    beforeEach ->
      @new_player = new Player()

    it 'should have last_facedown_cards', ->
      expect(@new_player.last_facedown_cards).not.toBe undefined

    it 'should have last_faceup_cards', ->
      expect(@new_player.last_faceup_cards).not.toBe undefined

    it 'should have hand_cards', ->
      expect(@new_player.hand_cards).not.toBe undefined

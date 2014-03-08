describe 'GameBehavior', ->
  beforeEach ->
    loadFixtures 'game'

  describe 'creating a new game', ->
    beforeEach ->
      num_of_players = 2
      @game = new Game(num_of_players)

    it 'should start the game', ->
      expect(@game.status).toBe 'STARTED'

    it 'used deck should be empty', ->
      expect(@game.used_deck.length).toBe 0  

    it 'new deck should have 36 cards after distribution', ->
      expect(@game.new_deck.length).toBe 34

    it 'there should be three player one last facedown cards', ->
      expect(@game.player[0].last_facedown_cards.length).toBe 3

    it 'there should be three player one last faceup cards', ->
      expect(@game.player[0].last_faceup_cards.length).toBe 3

    it 'there should be three player one hand cards', ->
      expect(@game.player[0].hand_cards.length).toBe 3

    it 'there should be three player two last facedown cards', ->
      expect(@game.player[1].last_facedown_cards.length).toBe 3

    it 'there should be three player two last faceup cards', ->
      expect(@game.player[1].last_faceup_cards.length).toBe 3

    it 'there should be three player two hand cards', ->
      expect(@game.player[1].hand_cards.length).toBe 3

    #xit 'should have initialized the html', ->
    #   expect($.contains(document.))


    #describe 'Whose turn is it?', ->
    #  beforeEach ->
    #    @game.whose_turn
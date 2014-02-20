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
      expect(@game.new_deck.length).toBe 36  


    #xit 'should have initialized the html', ->
    #   expect($.contains(document.))
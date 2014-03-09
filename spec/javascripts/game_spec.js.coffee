describe 'GameBehavior', ->
  beforeEach ->
    loadFixtures 'game'

  describe 'creating a new game', ->
    beforeEach ->
      @game = new Game(2)

    it 'should start the game', ->
      expect(@game.status).toBe 'STARTED'

    it 'should initialize an empty used deck', ->
      expect(@game.used_deck.length).toBe 0  

    it 'should leave new deck 34 cards after distribution', ->
      expect(@game.new_deck.length).toBe 34

    it 'should create three player one last facedown cards', ->
      expect(@game.player[0].last_facedown_cards.length).toBe 3

    it 'should create three player one last faceup cards', ->
      expect(@game.player[0].last_faceup_cards.length).toBe 3

    it 'should create three player one hand cards', ->
      expect(@game.player[0].hand_cards.length).toBe 3

    it 'should create three player two last facedown cards', ->
      expect(@game.player[1].last_facedown_cards.length).toBe 3

    it 'should create three player two last faceup cards', ->
      expect(@game.player[1].last_faceup_cards.length).toBe 3

    it 'should create three player two hand cards', ->
      expect(@game.player[1].hand_cards.length).toBe 3

    

    # xit 'should create three cards i'

    #xit 'should have initialized the html', ->
    #   expect($.contains(document.))


    #describe 'Whose turn is it?', ->
    #  beforeEach ->
    #    @game.whose_turn

    # describe 'creating a new game with 5 people', ->

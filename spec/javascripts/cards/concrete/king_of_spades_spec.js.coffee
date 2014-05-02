describe 'KingOfSpades Unit', ->
  beforeEach ->
    @king_of_spades = new App.Models.KingOfSpades

  it 'num should be "NINE" and suit should be "DIAMONDS"', ->
    expect @king_of_spades.suit
      .toEqual 'SPADES'
    expect @king_of_spades.num
      .toEqual 'KING'

  it '#play_on_top_of(used_deck), used_deck being empty, should return true', ->
    used_deck_double = new Backbone.Collection
    expect @king_of_spades.play_on_top_of used_deck_double
      .toBe true

  it '#play_on_top_of(used_deck), top being ACE_OF_HEARTS_DOUBLE, should return false', ->
    
    ace_of_hearts_double = new Backbone.Model {'suit': 'HEARTS', 'num': 'ACE' }
    used_deck_double = new Backbone.Collection [ace_of_hearts_double]
    expect @king_of_spades.play_on_top_of used_deck_double
      .toBe false

  it '#play_on_top_of(TWO_OF_SPADES) should return true', ->
    
    two_of_spades_double = new Backbone.Model {'suit': 'SPADES', 'num': 'TWO' }
    used_deck_double = new Backbone.Collection [two_of_spades_double]
    expect @king_of_spades.play_on_top_of used_deck_double
      .toBe true

  it '#play_on_top_of(FOUR_OF_SPADES) should return true', ->
    
    four_of_spades_double = new Backbone.Model {'suit': 'SPADES', 'num': 'FOUR' }
    used_deck_double = new Backbone.Collection [four_of_spades_double]
    expect @king_of_spades.play_on_top_of used_deck_double
      .toBe true

  it '#play_on_top_of(FIVE_OF_SPADES) should return true', ->
    
    five_of_spades_double = new Backbone.Model {'suit': 'SPADES', 'num': 'FIVE' }
    used_deck_double = new Backbone.Collection [five_of_spades_double]
    expect @king_of_spades.play_on_top_of used_deck_double
      .toBe true

  it '#play_on_top_of(SIX_OF_SPADES) should return true', ->
    
    six_of_spades_double = new Backbone.Model {'suit': 'SPADES', 'num': 'SIX' }
    used_deck_double = new Backbone.Collection [six_of_spades_double]
    expect @king_of_spades.play_on_top_of used_deck_double
      .toBe true

  it '#play_on_top_of(SEVEN_OF_SPADES) should return true', ->
    
    seven_of_spades_double = new Backbone.Model {'suit': 'SPADES', 'num': 'SEVEN' }
    used_deck_double = new Backbone.Collection [seven_of_spades_double]
    expect @king_of_spades.play_on_top_of used_deck_double
      .toBe false

  it '#play_on_top_of(EIGHT_OF_SPADES) should return false', ->
    
    eight_of_spades_double = new Backbone.Model {'suit': 'SPADES', 'num': 'EIGHT' }
    used_deck_double = new Backbone.Collection [eight_of_spades_double]
    expect @king_of_spades.play_on_top_of used_deck_double
      .toBe true

  it '#play_on_top_of(NINE_OF_SPADES) should return false', ->
    
    nine_of_spades_double = new Backbone.Model {'suit': 'SPADES', 'num': 'NINE' }
    used_deck_double = new Backbone.Collection [nine_of_spades_double]
    expect @king_of_spades.play_on_top_of used_deck_double
      .toBe true

   it '#play_on_top_of(TEN_OF_SPADES) to throw an error', ->
    
    ten_of_spades_double = new Backbone.Model {'suit': 'SPADES', 'num': 'TEN' }
    used_deck_double = new Backbone.Collection [ten_of_spades_double]
    expect => @king_of_spades.play_on_top_of used_deck_double
      .toThrow "Not allowed to play anything on top of TEN_OF_SPADES"


  it '#play_on_top_of(JACK_OF_SPADES) should return false', ->
    
    jack_of_spades_double = new Backbone.Model {'suit': 'SPADES', 'num': 'JACK' }
    used_deck_double = new Backbone.Collection [jack_of_spades_double]
    expect @king_of_spades.play_on_top_of used_deck_double
      .toBe true

  it '#play_on_top_of(QUEEN_OF_SPADES) should return false', ->
    
    queen_of_spades = new Backbone.Model {'suit': 'SPADES', 'num': 'QUEEN' }
    used_deck_double = new Backbone.Collection [queen_of_spades]
    expect @king_of_spades.play_on_top_of used_deck_double
      .toBe true

  it '#play_on_top_of(KING_OF_SPADES) should return false', ->
    
    king_of_spades_double = new Backbone.Model {'suit': 'SPADES', 'num': 'KING' }
    used_deck_double = new Backbone.Collection [king_of_spades_double]
    expect @king_of_spades.play_on_top_of used_deck_double
      .toBe true


  describe '#play_on_top_of([...THREE_OF_CLUBS])', ->
    it 'and no other cards afterwards should return true', ->
      three_of_clubs_double = new Backbone.Model {'suit': 'CLUBS', 'num': 'THREE' }
      used_deck_double = new Backbone.Collection [three_of_clubs_double]
      expect @king_of_spades.play_on_top_of used_deck_double
        .toBe true

    beforeEach ->
      @three_of_clubs_double = new Backbone.Model {'suit': 'CLUBS', 'num': 'THREE' }

    it '[ACE_OF_DIAMONDS...] afterwards should return false', ->
      ace_of_clubs_double = new Backbone.Model {'suit': 'DIAMONDS', 'num': 'ACE' }
      used_deck_double = new Backbone.Collection [ace_of_clubs_double, @three_of_clubs_double]
      expect @king_of_spades.play_on_top_of used_deck_double
        .toBe false

    it '[FOUR_OF_SPADES...] afterwards should return true', ->
      four_of_spades_double = new Backbone.Model {'suit': 'SPADES', 'num': 'FOUR'}
      used_deck_double = new Backbone.Collection [four_of_spades_double, @three_of_clubs_double]
      expect @king_of_spades.play_on_top_of used_deck_double 
        .toBe true

    it '[TWO_OF_HEARTS...] afterwards should return true', ->
      two_of_hearts_double = new Backbone.Model {'suit': 'HEARTS', 'num': 'TWO'}
      used_deck_double = new Backbone.Collection [two_of_hearts_double, @three_of_clubs_double]
      expect @king_of_spades.play_on_top_of used_deck_double 
        .toBe true

    it '[TWO_OF_HEARTS, THREE_OF_HEARTS...] afterwards should return false', ->
      two_of_hearts_double = new Backbone.Model {'suit': 'HEARTS', 'num': 'TWO'}
      three_of_hearts_double = new Backbone.Model {'suit': 'HEARTS', 'num': 'THREE'}
      used_deck_double = new Backbone.Collection [
        two_of_hearts_double, three_of_hearts_double, @three_of_clubs_double
      ]
      expect @king_of_spades.play_on_top_of used_deck_double 
        .toBe true

    it '[FIVE_OF_CLUBS, THREE_OF_DIAMONDS, THREE_OF_HEARTS, THREE_OF_SPADES...] ' +
       'afterwards should return false', ->
      five_of_hearts_double = new Backbone.Model {'suit': 'HEARTS', 'num': 'FIVE'}
      three_of_diamonds_double = new Backbone.Model {'suit': 'DIAMONDS', 'num': 'THREE'}
      three_of_hearts_double = new Backbone.Model {'suit': 'HEARTS', 'num': 'THREE'}
      used_deck_double = new Backbone.Collection [
        five_of_hearts_double 
        three_of_diamonds_double 
        three_of_hearts_double 
        @three_of_clubs_double
      ]
      expect @king_of_spades.play_on_top_of used_deck_double 
        .toBe true

    it '[THREE_OF_DIAMONDS, THREE_OF_HEARTS, THREE_OF_SPADES...] ' +
       'afterwards should return false', ->
      three_of_diamonds_double = new Backbone.Model {'suit': 'DIAMONDS', 'num': 'THREE'}
      three_of_hearts_double = new Backbone.Model {'suit': 'HEARTS', 'num': 'THREE'}
      used_deck_double = new Backbone.Collection [
        three_of_diamonds_double 
        three_of_hearts_double 
        @three_of_clubs_double
      ]
      expect @king_of_spades.play_on_top_of used_deck_double 
        .toBe true

describe "Card", ->
  it 'should throw error since it is an abstract class', ->
    expect => new App.Models.Card
      .toThrow 'Num is UNDEFINED. Card is an abstract class'
    expect => new App.Models.Card {"num": "SEVEN"}
      .toThrow 'Suit is UNDEFINED. Card is an abstract class'

    # card = new App.Models.Card {"num": "SEVEN", "suit": "HEARTS" }
    # expect => card.non_special_cases
    #   .toThrow 'non_special_cases private method is undefined. ' +
    #     'Card is an abstract class.'
    


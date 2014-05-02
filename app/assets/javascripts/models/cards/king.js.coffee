class App.Models.King extends App.Models.Card

  num: 'KING'

  initialize: ->
    @num = 'KING'
    @suit = '' 

    throw 'Suit is UNDEFINED. King is an abstract class.' if !@suit

  _non_special_cases: (current_card_num) ->
    switch current_card_num
      when "SEVEN", "ACE" then false
      when "TWO", "THREE", "FOUR", "FIVE", "SIX" then true
      when "EIGHT", "NINE", "JACK", "QUEEN", "KING" then true
      when "TEN" then throw "Not allowed to play anything on top of " +
        "TEN_OF_SPADES"

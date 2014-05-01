class App.Models.Eight extends App.Models.Card
  num: 'EIGHT'

  initialize: ->
    @num = 'EIGHT'
    @suit = '' 

    throw 'Suit is UNDEFINED. Seven is an abstract class.' if !@suit

  _non_special_cases: (current_card_num) ->
    switch current_card_num
      when "ACE", "SEVEN", "NINE", "JACK", "QUEEN", "KING" then false
      when "TWO", "THREE", "FOUR", "FIVE", "SIX", "EIGHT" then true
      when "TEN" then throw "Not allowed to play anything on top of " +
        "TEN_OF_SPADES"

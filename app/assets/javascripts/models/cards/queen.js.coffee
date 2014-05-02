class App.Models.Queen extends App.Models.Card

  num: 'QUEEN'

  initialize: ->
    @num = 'QUEEN'
    @suit = '' 

    throw 'Suit is UNDEFINED. Queen is an abstract class.' if !@suit

  _non_special_cases: (current_card_num) ->
    switch current_card_num
      when "SEVEN", "ACE", "KING" then false
      when "TWO", "THREE", "FOUR", "FIVE", "SIX", "EIGHT", "NINE", "JACK", "QUEEN" then true
      when "TEN" then throw "Not allowed to play anything on top of " +
        "TEN_OF_SPADES"

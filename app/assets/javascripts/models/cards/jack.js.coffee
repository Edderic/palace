class App.Models.Jack extends App.Models.Card

  num: 'JACK'

  initialize: ->
    @num = 'JACK'
    @suit = '' 

    throw 'Suit is UNDEFINED. Jack is an abstract class.' if !@suit

  _non_special_cases: (current_card_num) ->
    switch current_card_num
      when "SEVEN", "ACE", "QUEEN", "KING" then false
      when "TWO", "THREE", "FOUR", "FIVE", "SIX",  "EIGHT", "NINE", "JACK" then true
      when "TEN" then throw "Not allowed to play anything on top of " +
        "TEN_OF_SPADES"

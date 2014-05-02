class App.Models.Nine extends App.Models.Card

  num: 'NINE'

  initialize: ->
    @num = 'NINE'
    @suit = '' 

    throw 'Suit is UNDEFINED. Nine is an abstract class.' if !@suit

  _non_special_cases: (current_card_num) ->
    switch current_card_num
      when "SEVEN", "ACE", "JACK", "QUEEN", "KING" then false
      when "TWO", "THREE", "FOUR", "FIVE", "SIX",  "EIGHT", "NINE" then true
      when "TEN" then throw "Not allowed to play anything on top of " +
        "TEN_OF_SPADES"

class App.Models.Ten extends App.Models.Card

  num: 'TEN'

  initialize: ->
    @num = 'TEN'
    @suit = '' 

    throw 'Suit is UNDEFINED. Nine is an abstract class.' if !@suit

  _non_special_cases: (current_card_num) ->
    switch current_card_num
      when "SEVEN", "ACE", "JACK", "QUEEN", "KING" then true
      when "TWO", "THREE", "FOUR", "FIVE", "SIX",  "EIGHT", "NINE" then true
      when "TEN" then throw "Not allowed to play anything on top of " +
        "TEN_OF_SPADES"

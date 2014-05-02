class App.Models.Ace extends App.Models.Card

  num: 'ACE'

  initialize: ->
    @num = 'ACE'
    @suit = '' 

    throw 'Suit is UNDEFINED. Ace is an abstract class.' if !@suit

  _non_special_cases: (current_card_num) ->
    switch current_card_num
      when "SEVEN" then false
      when "ACE", "EIGHT", "NINE", "JACK", "QUEEN", "KING" then true
      when "TWO", "THREE", "FOUR", "FIVE", "SIX" then true
      when "TEN" then throw "Not allowed to play anything on top of " +
        "TEN_OF_SPADES"
class App.Models.Seven extends Backbone.Model
  num: 'SEVEN'

  initialize: ->
    @num = 'SEVEN'
    @suit = '' 

    throw 'Suit is UNDEFINED. Seven is an abstract class.' if !@suit

  play_on_top_of: (used_deck) ->
    return true if used_deck.size() is 0
    current_card_num = used_deck.last().get('num')
    if current_card_num is 'THREE'
      peek used_deck
    else non_special_cases current_card_num

  peek = (used_deck) ->
    size = used_deck.size()
    if size is 1
      true
    else
      index = size - 2 # diff is [0, 50]
      recursive_search_for_non_three(used_deck, index)

  recursive_search_for_non_three = (used_deck, index) ->
    current_card = used_deck.models[index]
    current_card_num = current_card.get 'num'
    
    if index is 0 or current_card_num isnt 'THREE' 
      non_special_cases current_card_num
    else 
      recursive_search_for_non_three used_deck, index-1

  non_special_cases = (current_card_num) ->
    switch current_card_num
      when "ACE", "EIGHT", "NINE", "JACK", "QUEEN", "KING" then false
      when "TWO", "THREE", "FOUR", "FIVE", "SIX", "SEVEN" then true
      
  # class PassedUsedDeckIsNull
  #   constructor: ->
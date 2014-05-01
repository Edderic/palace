class App.Models.Card extends Backbone.Model
  initialize: ->

    @num = ''
    @suit = ''

    throw 'Num is UNDEFINED. Card is an abstract class' if !@.get 'num'
    throw 'Suit is UNDEFINED. Card is an abstract class' if !@.get 'suit'
    # throw '@_non_special_cases private method is undefined. Card is an abstract class.' 

  play_on_top_of: (used_deck) ->
    return true if used_deck.size() is 0
    current_card_num = used_deck.last().get('num')
    if current_card_num is 'THREE'
      @_peek used_deck
    else @_non_special_cases current_card_num

  _peek: (used_deck) ->
    size = used_deck.size()
    if size is 1
      true
    else
      index = size - 2 # diff is [0, 50]
      @_recursive_search_for_non_three(used_deck, index)

  _recursive_search_for_non_three: (used_deck, index) ->
    current_card = used_deck.models[index]
    current_card_num = current_card.get 'num'
    
    if index is 0 or current_card_num isnt 'THREE' 
      @_non_special_cases current_card_num
    else 
      @_recursive_search_for_non_three used_deck, index-1

  _non_special_cases: (current_card_num) ->
    throw "Card is an abstract class. Please subclass and defined #_non_special_cases"
    
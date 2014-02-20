class @Card
  constructor: (@suit, @num) ->

  ###

  1. Select a card randomly,
  2. Remove that card from the pile.
  3. Repeat until no more cards left.

                   Before splice      Before splice
  Preconditions:   Start = 51,      unshuffled.length == 52
  1st in-loop:     index = [0, 51]  unshuffled.length == 52
  2nd in-loop:     index = [0, 50]  unshuffled.length == 51
    ...
  51nd in-loop:    index = [0,1],   unshuffled.length == 2
  52nd in-loop:    index = [0,0],   unshuffled.length == 1
  Postconditions:  Start = -1 

  ###

  @new_deck: ->
    unshuffled = @unshuffled_deck()
    start = 51

    shuffled = []

    while unshuffled.length > 0
      index = Math.round(Math.random() * start)
      card = unshuffled.splice(index, 1)[0]
      shuffled.push(card)
      start--

    return shuffled

  @suits:
    ['spades', 'hearts', 'diamonds', 'clubs']

  @nums:
    ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']

  @unshuffled_deck: ->
    cards = []
    for num in @nums
      for suit in @suits
        cards.push(new Card(suit, num))
    return cards


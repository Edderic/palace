### 
  Separate Model, View, and Controller-related code.
  Encapsulate classes to simulate private methods and
  keep public stuff public.
###

class @Game
  constructor: (@num_of_players)->
    @status = "STARTED"
    @player = []
    @used_deck = []
    @new_deck = Card.new_deck()

    for idx in [0...@num_of_players]
      @player.push(new Player())
      @distribute_cards(idx)


  distribute_cards: (idx) ->

    for card_idx in [0..2]
      @player[idx].last_facedown_cards.push(@new_deck.pop())
      @player[idx].last_faceup_cards.push(@new_deck.pop())
      @player[idx].hand_cards.push(@new_deck.pop())
  

    


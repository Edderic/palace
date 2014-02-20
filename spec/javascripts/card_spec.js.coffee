describe 'Cards', ->
  it 'creating a new deck should give us 52 cards', ->
    new_deck = Card.new_deck()
    expect(new_deck.length).toBe 52
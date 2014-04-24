describe 'Seven', ->
  it 'should throw "Suit is UNDEFINED. Seven is an abstract class."', ->
    expect => new App.Models.Seven
      .toThrow('Suit is UNDEFINED. Seven is an abstract class.')

require_relative "card"

class Deck
  attr_accessor :deck

  def initialize
    @deck = []
    make_deck
  end

  def make_deck
    suits = [:spade, :club, :heart, :diamond]
    value = (1..13).to_a
    i = 0
    suits.each do |suit|
       value.each do |val|
         @deck[i] = Card.new(val, suit)
         i += 1
       end
    end

    @deck.shuffle!
  end

end

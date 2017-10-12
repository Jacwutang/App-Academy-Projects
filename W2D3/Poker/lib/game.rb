require_relative 'player.rb'
require_relative 'deck.rb'

class Game
  attr_reader :deck, :player

  def initialize(deck = Deck.new, total_pot_amount = 0)
    @deck = deck
    @total_pot_amount
    @player = Player.new("Player",[], 0)
  end

  def deal_hand
    5.times do
      @player.hand << @deck.deck.pop
    end
  end

  def draw_card
    until @player.hand.length == 5
      @player.hand << @deck.deck.pop
    end
  end

  

end

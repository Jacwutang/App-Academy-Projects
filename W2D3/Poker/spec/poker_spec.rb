require "game"
require "rspec"
require "player"

RSpec.describe "Poker" do

  describe Game do


    describe "#initialize" do
      let(:game) {Game.new}

      it "creates size 52 deck" do
        expect(game.deck.size).to eq(52)
      end

    end



  end

  describe Card do

    describe "#initialize" do

    end

  end

  describe Deck do

    describe "#initialize" do
    end

  end

  describe Player do

    describe "#discard_card" do
      let(:player) {Player.new("Jack",[1,2,3,4,5],"100")}

      it "actually discards card" do
        old_size = player.hand.size # 5
        expect(player.discard_card.size).to_not eq(old_size)
      end
    end

  end


end

class Player
  attr_accessor :name, :hand, :pot

  def initialize(name,hand = [],pot)
    @name = name
    @hand = hand
    @pot = pot
  end

  def discard_card
    puts "What cards do you want to discard"
    cards_to_discard = gets.chomp.split(",").map(&:to_i)
    @hand.reject!.each_with_index {|card,i| cards_to_discard.include?(i)}
    @hand
  end

  def player_decide
    puts "What would you like to do?\n"
    puts "Fold, see or raise."
    decision = gets.chomp
      case  decision

      when "fold"
        fold
      when "raise"
        raise_method
      when "see"
        see
      end #case

  end

  def fold

  end


  def raise_method

  end

  def see


  end



end

module CardCheck

 def is_flush?(hand)
   hand.each_with_index do |card,idx|
     return false if card.suit == hand[idx + 1].suit
   end
   true
 end

 def royal_flush?(hand)
   sorted_hand = hand.sort_by {|card| card.value }
   return false if hand.first.value != 10
   sorted_hand.each_with_index do |card, idx|
     return false if hand[idx + 1].value - card.value != 1
   end
   true
 end

 def straight?(hand)
   sorted_hand = hand.sort_by {|card| card.value }
   sorted_hand.each_with_index do |card, idx|
     return false if hand[idx + 1].value - card.value != 1
   end
   true
 end


end


class Hand

  def initialize
    @player_hand
  end

  def hand_value(player_hand)
    sorted_hand = player_hand.sort


  end
end

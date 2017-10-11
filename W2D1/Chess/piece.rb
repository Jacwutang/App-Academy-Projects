require "colorize.rb"
class Piece
  # include SlidingPiece

  attr_reader :symbol
  def initialize(pos, board)
    @symbol = "p"
    @pos = pos
    @board =  board
  end

  def moves

    legal_moves = []

  end
end


class NullPiece < Piece

#  include Singleton

  def initialize
    @symbol = " "
  end
end

class King < Piece
  

end



module SlidingPiece
  def move_dirs(direction)

  end
end

module SteppingPiece

end

module Singleton

end

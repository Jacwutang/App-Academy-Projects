require_relative 'piece.rb'

class Board

attr_accessor :grid
  def initialize
    @grid = Array.new(8) {Array.new(8)}
    @grid.each_with_index do |row, i|
      row.each_with_index do |col, j|
        if i == 0 || i == 1 ||
         i == 6 || i == 7
            @grid[i][j] = Piece.new
        else
            @grid[i][j] = NullPiece.new
        end
      end
    end

  end

  [0,0]

  def [](pos)

    row,col = pos
    return nil if row > 7 || col > 7

    @grid[row][col]
  end

  def []=(pos, value)
    row,col = pos
    @grid[row][col] = value
  end

  def move_piece(start_pos,end_pos)

    p end_pos, 'end pos'
    p self[end_pos], "self"
    p self[end_pos].class, "class"
      #@grid[start_pos]
    #p NullPiece
    if self[start_pos].class == NullPiece
      raise ArgumentError.new("you can't move a NullPiece")
    elsif self[end_pos] == nil
      raise ArgumentError.new("you can't move off the board")
    else
      self[end_pos] = self[start_pos]
      self[start_pos] = NullPiece
    end
    # grid[start_pos] versus grid[start_pos[0], start_pos[1]]
    #@grid [end_pos] = @grid[start_pos]
    #@grid[start_pos] = NullPiece

  end


  # def board
  #   @board
  # end

end

#b1 = Board.new
#p b1.grid
#b1.move_piece([0,0], [9,9])
#b1.move_piece([0,0],[0,1])

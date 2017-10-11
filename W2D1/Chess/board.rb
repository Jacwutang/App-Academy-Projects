require_relative 'piece.rb'

class Board

attr_accessor :grid
  def initialize
    row_arr  = []
    @grid = Array.new(8) {Array.new(8)}
    @grid.each_with_index do |row, i|
      row.each_with_index do |col, j|
        if i == 0 || i == 1 ||
         i == 6 || i == 7
             @grid[i][j] = Piece.new([i,j],@grid)


        else
            @grid[i][j] = NullPiece.new

        end
      end

  end


end

def [](pos)

    row,col = pos
    return nil if row > 7 || col > 7
    return nil if row < 0 || col < 0
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

end


b = Board.new
king = King.new([0,5],b)

#p b[0,5]

require_relative "cursor.rb"
require_relative "board.rb"
require "colorize.rb"
class Display
  def initialize
    @board = Board.new
    @cursor = Cursor.new([0,0], @board)
  end

  def run_cursor
        #render
        until @cursor.get_input == :return #||
           #@cursor.get_input == :space

        render
        end

  end


  def render
    @board.grid.each_with_index do |row, i|
      puts "---------------------------------"
      print "|"
      row.each_with_index do |col, j|
        if @cursor.cursor_pos == [i,j]
          print " " + col.symbol.colorize(:red) + " |"
        else
        print " " + col.symbol + " |"
      end
    end
      puts ""
    end

    3.times do
    puts ""
    end
  end


end

d = Display.new
d.run_cursor

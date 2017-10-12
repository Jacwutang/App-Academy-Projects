class Hanoi
  attr_reader :board
  def initialize
    @board = [[3,2,1], [], [] ]

  end

  def get_move(from_tower,to_tower)

    if check_conflict(from_tower,to_tower) == false
      moving_piece = @board[from_tower].pop()
      @board[to_tower].push(moving_piece)
    else
      puts "Invalid move!"
    end

  end

  def check_conflict(from_tower,to_tower)
    moving_piece = @board[from_tower].last
    if @board[to_tower].length == 0
      return false
    elsif moving_piece > @board[to_tower].last
      return true
    end
    false
  end

  def render
    puts "#{@board[0]} \n"
    puts "#{@board[1]} \n"
    puts "#{@board[2]} \n"
  end

  def won?
    @board[2] == [3,2,1]
  end

  def get_input
    puts "Select a tower to move from and to"
    move_arr = gets.chomp.split(',').map(&:to_i)
    move_arr
  end

  def play

    until won?
      towers = get_input
      from_tower = towers[0]
      to_tower = towers[1]
      get_move(from_tower, to_tower)
      render
    end
    puts "Game over!"
  end



end

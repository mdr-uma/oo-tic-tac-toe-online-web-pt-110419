require 'pry'
class TicTacToe

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def initialize #(board = nil)
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(string)
    string.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)

    @board[index] != " "

  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn_count
    @board.count {|x| x != " "}
  end

  def current_player
    turn_count.even? ? "X" : "O"
    #turn_count %2 == 0? "X" : "O"
  end

  def turn
    puts "Please enter 1 - 9"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      token= current_player
      move(index,token)
    else
      turn
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      if (@board[combo[0]]) == "X" && (@board[combo[1]]) == "X" && (@board[combo[2]]) == "X"
        return combo
      elsif (@board[combo[0]]) == "O" && (@board[combo[1]]) == "O" && (@board[combo[2]]) == "O"
        return combo
        end
      end
    end


  def full?
    @board.all? {|x| x != " "}

  end

  def draw?
     full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if combo = won?
      @board[combo[0]]
    end
  end

  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
  # def play
  #   until over?
  #   turn
  #   end
  #   if winner
  #     puts "Congratulations #{winner}!"
  #   else draw?
  #   # binding.pry
  #     puts "Cat's Game!"
  #
  #   end
  # end

end

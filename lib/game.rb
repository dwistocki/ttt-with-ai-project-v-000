require 'pry'

class Game
  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    return player_1 if board.cells.count("X").odd?
    return player_2 if board.cells.count("X").even?
  end

  def over?
    return true if !@board.cells.include?(" ")
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      @board.cells[win_combination[0]] == @board.cells[win_combination[1]] && @board.cells[win_combination[0]] == @board.cells[win_combination[2]] && @board.cells[win_combination[1]] != " "
    end
  end

  def draw?
    return false if won? != nil
    return true if over? == true
  end

  def winner
    if won?
      @board.cells[won?[0]]
    end
  end

  def turn
    # asks for a position number
    # gets a position number
    # converts position number to index for board
    # places correct token in the position

    puts "Please enter 1-9:"
    #binding.pry 
    input = gets.strip
    index = input.to_i-1
    if @board.valid_move?(index)
      @board.update(index, player_1)
      @board.display
    else
      #turn
      self.current_player.move(board)
    end
  end
end

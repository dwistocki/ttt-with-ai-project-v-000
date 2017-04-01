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
    return @player_1 if @board.cells.count("X").odd? || @board.cells.count("X") == 0
    return @player_2 if @board.cells.count("O").odd?
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
    move_position = self.current_player.move(board)
    if @board.valid_move?(move_position) == false
      self.turn
    else @board.update(move_position, current_player)
    end
    self.turn
  end
end

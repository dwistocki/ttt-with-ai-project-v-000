require "pry"

class Board
  attr_accessor :cells

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(position)
    @cells[position.to_i-1]
  end

  def full?
    return true if @cells.all? { |cell| cell == "X" || cell == "O" }
    false if @cells.any? { |cell| cell == " " }
  end

  def turn_count
    @cells.count { |cell| cell == "X" || cell == "O" }
  end

  def taken?(new_position)
    return true if @cells[new_position.to_i-1] == "X" || @cells[new_position.to_i-1] == "O"
    return false if @cells[new_position.to_i-1] == " "
  end

  def valid_move?(new_position)
    return false if !new_position.to_i.between?(1,9)
    return true if self.taken?(new_position) == false
  end

  def update(new_position, player)
    @cells[new_position.to_i-1] = player.token
  end
end

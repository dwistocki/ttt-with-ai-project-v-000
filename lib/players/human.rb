module Players
  class Human < Player
    def move(board)
      mover = gets.strip
      return mover
    end
  end
end

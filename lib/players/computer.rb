module Players
  class Computer < Player
    def move(board)
      puts "What's your move (use a number 1-9)?"
      return "#{rand(9)}"
    end
  end
end

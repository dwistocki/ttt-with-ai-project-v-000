module Players
  class Computer < Player
    def initialize
    end

    def move(board)
      puts "What's your move (use a number 1-9)?"
      gets.strip
    end
  end
end

module Players
  class Human < Player
    def move(board)
      puts "What's your move (use a number 1-9)?"
      gets.strip
    end
  end
end

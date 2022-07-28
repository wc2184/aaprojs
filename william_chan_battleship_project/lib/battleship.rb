require_relative "board"
require_relative "player"

class Battleship
    attr_accessor :board, :player

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = n * n / 2
    end

    def start_game
        board.place_random_ships
        puts board.num_ships
        puts board.print
    end

    def lose?
       if @remaining_misses <= 0
        puts "you lose"
        return true
       else
        return false
       end
    end

    def win?
        if board.num_ships == 0
            puts "you win"
            return true
        else
            return false
        end
    end

    def game_over?
        win? || lose? 
    end

    def turn
        pos = player.get_move #=> [3, 4]
        success = board.attack(pos)
        board.print
        if !success
            @remaining_misses -= 1
        end
        puts @remaining_misses

    end

end

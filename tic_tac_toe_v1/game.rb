require_relative "board.rb"
require_relative "human_player.rb"

class Game
    attr_reader :current
    def initialize(p1mark, p2mark)
        @p1 = HumanPlayer.new(p1mark)
        @p2 = HumanPlayer.new(p2mark)
        @current = @p1
        @board = Board.new
    end

    def switch_turn
        if @current == @p1
            @current = @p2
        else
            @current = @p1
        end
    end

    def play
        while @board.empty_positions?
            p 'hi'
            @board.print
            @board.place_mark(@current.get_position, @current.mark)
            if @board.win?(@current.mark)
                puts "#{@current.mark} won the game!"
                return
            else
                switch_turn
            end

        end
        puts "Draw. No one won."
        return 
    end
end

gamu = Game.new("X", "E")
p gamu.current
gamu.switch_turn
p gamu.current

gamu.switch_turn
p gamu.current

gamu.play
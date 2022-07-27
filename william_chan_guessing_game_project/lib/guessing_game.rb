class GuessingGame
    attr_reader :num_attempts
    # reminder that reader is for reading, writer is for = 
    def initialize(min, max)
        @min = min
        @max = max
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end 

    def game_over?
        @game_over
    end




    def check_num(num)
        @num_attempts += 1
        diff = @secret_num - num
        if diff > 0
            # too low guess
            puts "too small"
        elsif diff < 0
            puts "too big"
        else
            @game_over = true
            puts "You win!"
        end
    end

    def ask_user
        puts "enter a number: "
        check_num(gets.chomp.to_i)
    end

end

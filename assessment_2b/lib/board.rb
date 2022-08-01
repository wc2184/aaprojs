class Board

    attr_reader :max_height

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end

    def self.build_stacks(num)
        Array.new(num) {Array.new}
    end

    def initialize(stacks, height)
        raise 'rows and cols must be >= 4' if stacks < 4 || height < 4
        @stacks = Board.build_stacks(stacks)
        @max_height = height
    end

    def add(token, index)
        if @stacks[index].length < @max_height
            @stacks[index] << token
            return true
        elsif @stacks[index].length == @max_height
            return false
        end
    end

    def vertical_winner?(token)
        @stacks.any? {|ele| ele.length == @max_height && ele.include?(token)}
    end

    def horizontal_winner?(token)
        (0...@max_height).each do |i|
            # @stacks.each do |ele|
            # p ele[i] == token
            # end
            return true if @stacks.all? {|ele| ele[i] == token}
        end
        return false
    end

    def winner?(token)
        vertical_winner?(token) || horizontal_winner?(token)
    end

    

end

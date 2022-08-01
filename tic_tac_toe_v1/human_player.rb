class HumanPlayer
    attr_reader :mark
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        puts "Enter 2 nums, space in between, like 1 2 #{self.mark}'s turn"
        pos = gets.chomp
        raise "Error format bubba" if pos.length != 3
        pos.split(" ").map(&:to_i)
    end
end

bob = HumanPlayer.new("X")
# p bob.get_position  
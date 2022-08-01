class Board
    
    attr_reader :grid
    def initialize
        @grid = Array.new(3) {Array.new(3, "_")}
        p @grid
    end

    def valid?(pos)
        # if pos [] between 0 1 2 
        x = pos[0]
        y = pos[1]
        (x >= 0 && x <= 2) && (y >= 0 && y <= 2)
    end

    def empty?(pos)
        # check @grid if the spot is 1) valid and 2) is == "_"
        return false if !valid?(pos)
        grid_slot = @grid[pos[0]][pos[1]]
        # p grid_slot
       grid_slot == "_"
    end
    
    def place_mark(pos, mark)
        # mark as in, O or X 
        raise "Not valid or empty" if !empty?(pos) || !valid?(pos)
        x = pos[0]
        y = pos[1]
        @grid[x][y] = mark
    end 

    def print

        @grid.each {|ele| puts ele.join(" ")}
    end 

    def win_row?(mark)
        # gets X or O
        @grid.each do |row|
            return true if row.all? {|e| e == mark}
        end
        return false
    end

    def win_col?(mark)
        # gets X or O
        # go and do it 0 1 2 times, and inside , check all the @grid.each ele[i] here!
        3.times do |i|
            return true if @grid.all? {|ele| ele[i] == mark}
        end
        return false
    end

    def win_diagonal?(mark)
        ## 0,0 1,1 2,2
        # aim to just print it for now

        first = ""
        (0..2).to_a.each do |i|
            first += @grid[i][i]
        end
        p first

        second = ""
        (0..2).to_a.each do |i|
            second += @grid[i][2 - i]
        end
        p second

        first == mark * 3 || second == mark * 3














    #    first = (0...@grid[0].length).to_a.map do |i|
    #         p @grid[i][i]
    #     end

    #     second = (0...@grid[0].length).to_a.map do |i|
    #         p @grid[i][2 - i]
    #     end

    #     first.join("") == mark * 3 || second.join("") == mark * 3
    end

    def win?(mark)
        p 'win?'
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.flatten.include?("_")
    end
end

bord = Board.new
# p bord.valid?([4, 0])
# p bord.empty?([2, 0])
# p bord.place_mark([2, 0], 'X')
p bord.grid
# p bord.place_mark([1, 0], 'X')
# p bord.place_mark([1, 1], 'X')
p bord.place_mark([0, 2], 'X')
p bord.place_mark([1, 2], 'X')
p bord.place_mark([0, 0], 'X')
p bord.place_mark([2, 2], 'O')
# p bord.place_mark([2, 2], 'X')
bord.print
p bord.win_row?("X")
p bord.win_col?("X")
p bord.win_diagonal?("X")
p bord.win?("X")

p bord.place_mark([0, 1], "X")
p bord.place_mark([1, 0], "X")
p bord.place_mark([1, 1], "X")
p bord.place_mark([2, 1], "X")
bord.print
p 'empty'
p bord.empty_positions?

puts 'here diag'
p bord.win_diagonal?("X")

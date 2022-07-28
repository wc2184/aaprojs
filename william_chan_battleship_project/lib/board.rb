class Board
    attr_accessor :size, :grid
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n 
    end

    def [](arr)
        #arr is [1, 2]
        @grid[arr[0]][arr[1]]
    end

    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end

    def num_ships
        @grid.flatten.count(:S)
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts 'you sunk my battleship!'
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        while num_ships != @size * 1.0 / 4
            # p @grid[rand(0...grid.length)]
            # p @grid[0][rand(0...grid[0].length)]
            @grid[rand(0...self.grid.length)][rand(0...self.grid[0].length)] = :S
        end
    end

    def hidden_ships_grid
        # go through the og grid and replace :S with :N
        # new_grid = Array.new(grid.length) {Array.new(grid[0].length)}
        new_grid = []
        grid.each do |subArray|
            inner_arr = []
            subArray.each do |ele|
                if ele == :S
                    inner_arr << :N 
                else
                    inner_arr << ele
                end
            end
            new_grid << inner_arr
        end
        p grid
        p new_grid
        return new_grid
    end

    def self.print_grid(arr)
        arr.each do |subArray|
            puts subArray.join(" ")
        end
    end

    def cheat
        Board.print_grid(self.grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

    
end

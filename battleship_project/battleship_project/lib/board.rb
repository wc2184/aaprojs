class Board
    attr_reader :size, :grid
  def initialize(n)
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = n * n
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
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
    count = 0
    p self.size
    p num_ships
    while num_ships < self.size * 1.0 / 4
        # p self.grid[0]
        self.grid[rand(0...self.grid.length)][rand(0...self.grid[0].length)] = :S
    end
  end

  def hidden_ships_grid
    temp = @grid.dup
    puts 'hi'
    p temp
    puts 'bye'
    bigarr = []
    temp.each_with_index do |arr, i1|
        small = []
        arr.each_with_index do |ele, i2|
           if ele == :S
                small << :N 
           else
                small << ele
           end
            
        end
        p small
        bigarr << small
    end
    return bigarr
  end

  def self.print_grid(arr)
    arr.each do |ele|
        puts ele.join(" ")
    end
  end

  def cheat
    Board.print_grid(self.grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end

  #print grid is CLASS def self
end

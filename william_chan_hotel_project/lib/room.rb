class Room
    attr_accessor :capacity, :occupants

    def initialize(num)
        @capacity = num
        @occupants = []
    end

    def full?
        !(occupants.length < capacity)
    end

    def available_space
        # c 4 ,  o 2
        @capacity - @occupants.length
    end

    def add_occupant(name)
        if !full?
            @occupants << name
            return true
        else
            return false
        end
    end
end
class Flight
    attr_reader :passengers
    def initialize(flight_num, capacity)
        @flight_number = flight_num
        @capacity = capacity
        @passengers = []
    end

    def full?
         @passengers.length >= @capacity
    end

    def board_passenger(passenger_inst)
        if !full?
            @passengers << passenger_inst if passenger_inst.has_flight?(@flight_number)
        
        end
    end

    def list_passengers
        @passengers.map do |ele|
            ele.name
        end
    end

    def [](i)
        @passengers[i]
    end

    def <<(passenger)
        board_passenger(passenger)
    end
end
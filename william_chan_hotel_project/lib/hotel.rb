require_relative "room"

class Hotel

    attr_accessor :rooms
  
    def initialize(name, hash)
        @name = name
        room_hash = {}
        hash.each {|k, v| room_hash[k] = Room.new(v)}
        @rooms = room_hash
    end

    def name 
        @name.split.map(&:capitalize).join(" ")
    end

    def room_exists?(name)
        rooms.has_key?(name)
    end

    def check_in(person, room)
        if !room_exists?(room)
            puts 'sorry, room does not exist' 
        else
            if rooms[room].add_occupant(person)
                puts 'check in successful'
            else
                puts 'sorry, room is full'
            end
        end
    end

    def has_vacancy?
        rooms.values.each do |room|
            return true if !room.full?
        end
        return false
    end

    def list_rooms
        rooms.each do |name, room|
            puts name + room.available_space.to_s
        end
    end

end

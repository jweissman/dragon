module Dragon
  class Room < Place
    include Aspects

    attr_accessor :building, :people

    def self.generate(building,
                      type = available_types_for_building(building).sample)
      room           = type.new
      room.building  = building
      room.people    = []
      professions = building.available_professions
      (1..2).to_a.sample.times do
        profession = professions.shift
        room.people << Person.generate(profession: profession)
      end
      room
    end

    def self.generate_list(n, building: nil)
      type_list = (building.required_room_types + building.room_types.shuffle)
        .uniq.take(n)

      type_list.map do |type|
        generate(building, type)
      end
    end

    def self.required_types_for_building(building)
      building.required_room_types
    end

    def self.available_types_for_building(building)
      building.room_types.reject do |type|
        !type.available_in?(building) ||
          (type.unique? && type.any?)
      end
    end

    def self.available_in?(*)
      true
    end


    def self.unique
      false
    end
  end
end

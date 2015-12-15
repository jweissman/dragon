module Dragon
  class Room < Place
    attr_accessor :building, :people, :aspect

    def describe
      "#{aspect} #{type}"
    end

    def self.generate(building,
                      professions = building.associated_professions.shuffle,
                      type = available_types_for_building(building).sample)
      room  = type.new
      room.building = building
      room.aspect   = aspects.sample
      room.people   = Array.new([2,3].sample) do
        profession = professions.shift
        Person.generate(profession: profession)
      end
      room
    end

    def self.generate_list(n, building: nil, professions: nil)
      type_list = (building.required_room_types + building.room_types.shuffle)
        .uniq.take(n)

      type_list.map do |type|
        generate(building, professions, type)
      end
    end

    def self.required_types_for_building(building)
      building.required_room_types
    end

    def self.available_types_for_building(building)
      building.room_types.reject do |type|
        type.unique? && type.any?
      end
    end

    def self.aspects
      %w[ dusty dingy clean well-kept beautiful cold warm dirty ]
    end

    def self.unique
      false
    end
  end


  # for communing with the dead!
  class Psychomanteum < Room; end
end

module Dragon
  class Room < Place
    include Aspects

    attr_accessor :building, :people

    def self.generate(building,
                      type = available_types_for_building(building).sample)
      room           = type.new
      room.building  = building
      room.people    = []

      professions = building.professions.zip(room.professions).flatten.compact.uniq
      professions.take(room.people_count).each do |profession|
        room.people << Person.generate(profession: profession)
      end

      room
    end

    def people_count
      @people_sample ||= 2 # (3..4).to_a.sample
    end

    def required_professions
      []
    end

    def associated_professions
      self.class.associated(Profession)
    end

    def professions
      (required_professions + associated_professions) & Profession.available
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

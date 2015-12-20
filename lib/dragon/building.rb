module Dragon
  class Building < Place
    include Aspects

    include Professions
    include Cities
    include Rooms

    tagged :meeting

    attr_reader :rooms
    attr_accessor :city

    def rooms
      @rooms ||= Room.generate_list(room_count, building: self)
    end

    def required_room_types
      []
    end

    def room_types
      self.class.associated(Room)
    end

    def room_count
      @room_count ||= [3,4,5].sample
    end

    def required_professions
      []
    end

    def associated_professions
      return self.class.associated(Profession) unless city # FIXME concession for castle_spec

      self.class.associated(Profession).
        zip(city.class.associated(Profession)).
        flatten.compact
    end

    def professions
      required_professions +
        associated_professions +
        Profession.basic.shuffle +
        Profession.adventuring.shuffle
    end

    def available_professions
      professions.reject do |profession|
        profession.unique? && Person.any? do |person|
          person.profession.is_a?(profession)
        end
      end
    end

    def room_count
      @room_count ||= (3..6).to_a.sample
    end

    def self.generate(city, type=types_for_city(city).sample)
      building = type.new
      building.city = city
      building
    end

    def self.generate_list(n, city: nil)
      valid_types = types_for_city(city).uniq
      valid_types.take(n).map(&:new).map do |building|
        building.city = city
        building
      end
    end

    def self.available_in?(*)
      true
    end

    def self.required_in?(*)
      false
    end

    def self.types_for_city(city)
      required_types_for_city(city) + available_types_for_city(city)
    end

    def self.required_types_for_city(city)
      types.select do |type|
        type.required_in?(city)
      end
    end

    def self.available_types_for_city(city)
      available = types.select do |type|
        type.available_in?(city)
      end

      associated_and_available = associated_types_for_city(city) & available
      associated_and_available
    end

    def self.associated_types_for_city(city)
      (city.class.associated(Building) +
        city.subtype.class.associated(Building)).sort_by do |klass|
        klass.tags_in_common_with(Building)
      end
    end

    # more than 1 in the world
    def self.unique?
      false
    end
  end
end

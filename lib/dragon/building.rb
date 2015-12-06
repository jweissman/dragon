module Dragon
  class Building < Place
    attr_accessor :city, :aspect

    def self.generate(city, type=types_for_city(city).sample)
      building = type.new
      building.city = city
      building.aspect = aspects.sample
      building
    end

    def self.types
      [ House, Castle, Library, Tavern,
        Church, Hospital, Castle ]
    end

    def self.available_in?(*)
      true
    end

    def self.required_in?(*)
      false
    end

    def self.types_for_city(city)
      required_types = required_types_for_city(city)
      return required_types unless required_types.empty?

      available_types_for_city(city)
    end

    def self.required_types_for_city(city)
      available_types.select do |type|
        type.required_in?(city)
      end
    end

    def self.available_types_for_city(city)
      available_types.select do |type|
        type.available_in?(city)
      end
    end

    def describe
      "#{aspect} #{type}"
    end

    def rooms
      @rooms ||= Room.generate_list(room_count,
                                    building: self,
                                    professions: available_professions)
    end

    def room_count
      @room_count ||= [3,4,5].sample
    end

    def professions
      required_professions +
        associated_professions.shuffle +
        Profession.basic.shuffle +
        Profession.adventuring.shuffle
    end

    def available_professions
      professions.reject do |profession|
        profession.unique? && Person.any? { |person| person.profession == profession }
      end
    end

    def room_count
      @room_count ||= (3..6).to_a.sample
    end

    def self.aspects
      %w[ red orange grey blue green white tiny large small huge dingy quaint palatial glorious quaint modern ]
    end

    def self.unique?
      false
    end

    def required_professions
      []
    end

    def required_room_types
      []
    end

    def associated_professions
      raise 'override Building#associated_professions in subclass'
    end

    def room_types
      raise 'override Building#room_types in subclass'
    end
  end
end

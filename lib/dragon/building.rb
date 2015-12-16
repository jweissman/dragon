module Dragon
  class Building < Place
    include Professions
    include Cities
    include Rooms

    tagged :meeting

    attr_reader :rooms
    attr_accessor :city, :aspect

    def initialize(name=nil)
      @rooms = Room.generate_list(room_count,
                                  building: self,
                                  professions: available_professions)
      super(name)
    end

    def describe
      "#{aspect} #{type}"
    end

    def required_professions
      []
    end

    def required_room_types
      []
    end

    def associated_professions
      self.class.associated(Profession)
    end

    def room_types
      self.class.associated(Room)
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

    def self.generate(city, type=types_for_city(city).sample)
      building = type.new # types_for_city(city).sample.new
      building.city = city
      building.aspect = aspects.sample
      building
    rescue
      binding.pry
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
      types.select do |type|
        type.required_in?(city) && !city.any_buildings_of_type?(type)
      end
    end

    def self.available_types_for_city(city)
      available = types.select do |type|
        if type.unique?
          !city.any_buildings_of_type?(type) &&
            type.available_in?(city)
        else
          type.available_in?(city)
        end
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

    def self.aspects
      %w[ red orange grey blue green white
          tiny large small huge dingy quaint
          palatial glorious quaint modern ]
    end

    # more than 1 in the town
    def self.unique?
      true
    end
  end
end

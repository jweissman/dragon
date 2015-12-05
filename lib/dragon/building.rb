module Dragon
  class Building < Place
    attr_accessor :city, :aspect

    def self.generate(city, type=types.sample)
      building = type.new(name)
      building.city = city
      building.aspect = aspects.sample
      building
    end

    def self.generate_list(city, n)
      type_list = Building.types.sample(n)
      type_list.map { |type| generate(city, type) }
    end

    def describe
      "#{aspect} #{type}"
    end

    def rooms
      @rooms ||= Room.generate_list(self, 3)
    end

    def type
      self.class.name.split('::').last
    end

    def self.aspects
      %w[ red orange grey blue green white
          tiny large small huge
          dingy quaint
          palatial glorious
          quaint modern ]
    end

    def self.types
      [ House, Library, Tavern, Church, Hospital, Castle ]
    end

    def unique?
      false
    end

    def associated_professions
      raise 'override Building#associated_professions in subclass'
    end
  end

  class Library < Building
    def associated_professions
      %w[ student scribe professor reader ]
    end
  end

  class Tavern < Building
    def associated_professions
      %w[ barkeep drunk waiter gambler bard ]
    end
  end

  class Church < Building
    def associated_professions
      %w[ priest penitent acolyte ]
    end
  end

  class Hospital < Building
    def associated_professions
      %w[ nurse priest student ]
    end
  end
end


module Dragon
  class City < Struct.new(:name, :subtype, :feature)
    attr_accessor :world

    def self.generate(world)
      city = new(Name.generate, subtypes.sample, features.sample)
      city.world = world
      city
    end

    def self.subtypes
      %w[ imperial agricultural financial productive efficient quiet ]
    end

    def self.features
      %w[ secret_police dreams love many_goats too_many_books ]
    end

    def describe
      "#{name}, #{subtype} #{type} of #{feature.to_s.gsub('_', ' ')}"
    end

    def unique
      false
    end

    def type
      self.class.name.split('::').last
    end

    def random_place
      places.sample
    end

    def places
      buildings.map(&:rooms).flatten + areas
    end

    def buildings
      @buildings ||= Building.generate_list(self, 4)
    end

    def areas
      @areas ||= Area.generate_list(self, 2)
    end

    def self.types
      [ Hamlet, Village, Town, Metropolis, Capital ]
    end
  end

  class Capital < City
    def unique?
      true
    end
  end

  class Metropolis < City
  end

  class Town < City; end

  class Village < City; end

  class Hamlet < City; end
end

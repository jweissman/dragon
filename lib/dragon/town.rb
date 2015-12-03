module Dragon
  class Town < Struct.new(:name, :type, :subtype, :feature)
    attr_accessor :world

    def self.generate(world)
      town = new(Name.generate, types.sample, subtypes.sample, features.sample)
      town.world = world
      town
    end

    def self.subtypes
      %w[ imperial agricultural financial productive efficient quiet ]
    end

    def self.types
      %w[ town metropolis capital hamlet village community trading_post ]
    end

    def self.features
      %w[ secret_police dreams love many_goats too_many_books ]
    end

    def describe
      "#{name}, #{subtype} #{type} of #{feature.to_s.gsub('_', ' ')}"
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
  end
end

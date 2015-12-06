module Dragon
  class City < Entity
    attr_accessor :world, :subtype, :feature

    def initialize(name=Name.generate, 
                   subtype: nil, feature: nil, world: nil)
      @subtype = subtype
      @feature = feature
      @world = world
      super(name)
    end

    def self.generate(world, type = available_types.sample)
      type = available_types.sample
      city = type.new world: world, subtype: subtypes.sample, feature: features.sample
      city
    end

    def self.generate_list(n, world: world)
      type_list = (required_types + types.shuffle).uniq.take(n)
      type_list.map do |type|
        generate(world,type)
      end
    end

    def self.types_for(world)
      required = required_types.reject do |type|
        world.cities.map(&:type).include?(type)
      end

      return required unless required.empty?

      available_types
    end

    def self.subtypes
      %w[ lost royal imperial agricultural financial productive efficient quiet ]
    end

    def self.features
      %w[ secret_police dreams love many_goats too_many_books ]
    end

    def describe
      "#{name}, #{subtype} #{type} of #{feature.to_s.gsub('_', ' ')}"
    end

    def label
      "#{name} [#{type}]"
    end

    def random_place
      places.sample
    end

    def places
      buildings.map(&:rooms).flatten + areas
    end

    def buildings
      @buildings ||= Building.generate_list(self, 6)
    end

    def areas
      @areas ||= Area.generate_list(self, 2)
    end

    def self.types
      [ Outpost, Hamlet, Village, Metropolis, Capital ]
    end
 
    def self.required_types
      [ Capital ]
    end

    def self.unique?
      false
    end
  end

  class Capital < City
    def self.unique?
      true
    end
  end

  class Metropolis < City
  end

  class Village < City; end
  class Hamlet < City; end
  class Outpost < City; end
end


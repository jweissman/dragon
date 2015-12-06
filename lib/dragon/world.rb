module Dragon
  class World < Struct.new(:name, :type, :subtype, :wonder)
    def describe
      "#{name.capitalize}, #{subtype} #{type} of #{wonder.capitalize}"
    end

    def cities
      @cities ||= City.generate_list(7, world: self)
    end

    def random_hospital
      hospitals = cities.flat_map(&:buildings).select do |building|
        building.is_a?(Hospital)
      end

      hospitals.sample
    end

    def self.generate
      new(names.sample, types.sample, subtypes.sample, wonders.sample)
    end

    def self.names
      %w[ ea elos aurea yrtis lytheria palation kairos etol ]
    end

    def self.types
      %w[ plane realm earth world planet universe cosmos creation ]
    end

    def self.subtypes
      %w[ fearful fateful fell ominous glittering transcendent
          curious edenic verdant glorious precious golden luminous ]
    end

    def self.wonders
      %w[ dreams legends myths treasure secrets wonders riddles chaos love
          aeons blood the_moon ]
    end
  end
end



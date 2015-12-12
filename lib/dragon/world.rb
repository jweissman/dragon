module Dragon
  class World
    attr_reader :name, :type, :subtype, :wonder, :created_at

    def initialize(name: Name.generate,
                   type: self.class.types.sample, 
                   subtype: self.class.subtypes.sample, 
                   wonder: self.class.wonders.sample)
      @name = name
      @type = type
      @subtype = subtype
      @wonder = wonder

      @created_at = Time.now
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

    def narrator(terminal)
      WorldNarrator.new(self, terminal: terminal)
    end
  end
end

module Dragon
  class Creature < Combatant
    attr_accessor :subtype

    def initialize(name=nil, subtype: nil)
      @subtype = subtype
      super(name)
    end

    def self.generate(type: types.sample, place: nil)
      if place && (associated=place.class.associated(Creature)).any?
        type = associated.sample
      end
      creature = type.new
      creature.subtype = Subtype.generate_for(creature)
      creature
    end

    def base_range
      (5..8)
    end

    def power_range
      (9..12)
    end

    def intellect_range
      (4..5)
    end

    def calm_range
      (4..5)
    end

    def focus_range
      (7..10)
    end

    def coordination_range
      (7..10)
    end

    def resilience_range
      (5..7)
    end

    def label
      "#{subtype} #{type}"
    end

    def describe(prefix: 'the')
      "#{prefix} #{subtype} #{type}"
    end
  end
end

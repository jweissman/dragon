module Dragon
  class SizeClass
    include CombatAttributes

    # really 'the' base range for creatures at this point
    # should re-architect so that's a bit clearer
    def base_range
      (6..8)
    end

    def body_range
      (10..12)
    end

    def power_range
      body_range
    end

    def resilience_range
      body_range
    end
  end

  class Tiny < SizeClass
    def body_range
      (4..6)
    end
  end

  class VerySmall < SizeClass
    def body_range
      (6..8)
    end
  end

  class Small < SizeClass
    def body_range
      (8..10)
    end
  end

  class Medium < SizeClass
  end

  class Large < SizeClass
    def body_range
      (12..14)
    end
  end

  class VeryLarge < SizeClass
    def body_range
      (14..16)
    end
  end

  class Huge < SizeClass
    def body_range
      (16..18)
    end
  end


  class Creature < Combatant
    extend Forwardable

    def_delegators :subtype, :base_modifier, :calm_modifier, :focus_modifier, :intellect_modifier, :coordination_modifier, :resilience_modifier, :power_modifier

    def_delegators :size_class, :base_range, :calm_range, :focus_range, :intellect_range, :coordination_range, :resilience_range, :power_range

    def initialize(name=nil, subtype: nil)
      @subtype    = subtype
      super(name)
    end

    def label
      "#{subtype} #{type}"
    end

    def describe(prefix: 'the')
      "#{prefix} #{subtype} #{type}"
    end

    def size_class
      @size_class ||= self.class.size_class.new
    end

    def default_weapon
      @default_weapon ||= Teeth.new
    end

    def default_armor
      @default_armor ||= Fur.new
    end

    def subtype
      @subtype ||= Subtype.generate_for(self)
    end

    def self.generate(type: nil,
                      place: nil,
                      types_to_sample: [])

      if type.nil?
        if place && (associated=place.class.associated(Creature)).any?
          types_to_sample = associated
        else
          types_to_sample = types(nodes_only: true, exclude_types: [ Person ])
        end

        type = types_to_sample.sample
      end

      type.new
    end
  end
end

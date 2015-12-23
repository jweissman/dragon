module Dragon
  class Creature < Combatant
    attr_accessor :subtype

    def initialize(name=nil, subtype: nil)
      @subtype = subtype
      super(name)
    end

    def default_weapon
      @default_weapon ||= Teeth.new
    end

    def default_armor
      @default_armor ||= Fur.new
    end

    def self.generate(type: nil,
                      place: nil,
                      types_to_sample: [],
                      excluded_types: [])

      if type.nil?
        if place && (associated=place.class.associated(Creature)).any?
          types_to_sample = associated
        else
          types_to_sample = types(nodes_only: true)
        end

        if excluded_types.any?
          types_to_sample.reject! do |type_to_sample|
            excluded_types.any? do |excluded_type|
              type_to_sample.new.is_a?(excluded_type)
            end
          end
        end

        type = types_to_sample.sample
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

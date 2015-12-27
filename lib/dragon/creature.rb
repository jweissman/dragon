module Dragon
  class Creature < Combatant
    extend Forwardable

    def_delegators :subtype, :base_modifier, :calm_modifier, :focus_modifier, :intellect_modifier, :coordination_modifier, :resilience_modifier, :power_modifier

    def_delegators :size_class, :resilience_range, :power_range
    def_delegators :mind_class, :intellect_range,  :focus_range
    def_delegators :spirit_class, :calm_range, :coordination_range

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

    def mind_class
      @mind_class ||= self.class.mind_class.new
    end

    def spirit_class
      @spirit_class ||= self.class.spirit_class.new
    end

    def self.mind_class
      Simple
    end

    def self.size_class
      Medium
    end

    def self.spirit_class
      GoodSpirited
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

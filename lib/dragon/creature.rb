module Dragon
  class Creature < Combatant
    attr_reader :subtype

    def initialize(name=nil, subtype: nil)
      @subtype = subtype
      super(name)
    end

    def self.generate(type: types.sample, subtype: subtypes.sample)
      type.new('(animal)', subtype: subtype)
    end

    def attack_rating
      6
    end

    def defense_rating
      2
    end

    def max_hp
      @map_hp ||= self.class.max_hp
    end

    def self.max_hp
      20
    end

    def label
      "#{subtype} #{type}"
    end

    def describe(prefix: 'the')
      "#{prefix} #{subtype} #{type}"
    end

    def self.subtypes
      %w[ mutant forest feral angry weird uncanny toxic glowing strange ]
    end
  end
end

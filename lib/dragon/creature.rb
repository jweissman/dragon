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
  end
end

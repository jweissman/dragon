module Dragon
  class Enemy
    extend Random
    extend Forwardable

    def_delegators :entity, :is_a?,
      :subtype, :label, :describe, :hp, :max_hp, :xp, :bounty, 
      :defense_rating, :attack_rating, :take_damage!, :alive?, 
      :chance_of_hitting, :attack!

    attr_reader :entity

    def initialize(entity)
      @entity = entity
    end

    def self.generate
      entity = sample_percentages(type_percentages).call
      new(entity)
    end

    def self.type_percentages
      @type_distro ||= { 
        80 => -> { Creature.generate }, 
        20 => -> { Person.generate }
      }
    end
  end
end

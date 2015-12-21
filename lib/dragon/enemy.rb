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

    def self.generate(place)
      entity = sample_percentages(type_percentages(place)).call
      new(entity)
    end

    def self.type_percentages(place)
      if place.class.populated?
        {
          25 => -> { Creature.generate(place: place) },
          75 => -> { Person.generate }
        }
      else
        {
          85 => -> { Creature.generate(place: place) },
          15 => -> { Person.generate }
        }
      end
    end
  end
end

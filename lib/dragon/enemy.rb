module Dragon
  class Enemy
    extend Random
    extend Forwardable

    def_delegators :entity, :is_a?,
      :subtype, :label, :describe, :hp, :max_hp, :xp, :bounty, :weapon,
      :defense_rating, :attack_rating, :take_damage!, :alive?,
      :chance_of_hitting, :attack!

    attr_reader :entity

    def initialize(entity)
      @entity = entity
    end

    def self.generate(place, challenge_level=0)
      creature = generate_creature(place, challenge_level)
      new(creature)
    end

    def self.creature_types_for_challenge_level(place, level)
      associated_types = place.class.associated(Creature) 
      associated_types.reject { |t| t.new.challenge_rating > level }
      if associated_types.empty?
        Creature.types(exclude_types: [Person]).reject { |t| t.new.challenge_rating > level }
      else
        associated_types
      end
    end

    def self.generate_creature(place, challenge_level)
      types = creature_types_for_challenge_level(place, challenge_level)
      types.sample.new
    end
  end
end

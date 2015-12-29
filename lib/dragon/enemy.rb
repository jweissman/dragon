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

    def self.generate(place, challenge_level=1)
      creature = generate_creature(place, challenge_level)
      new(creature)
    end

    def self.generate_creature(place, challenge_level)

      # types = place.class.associated(Creature) 
      types = Creature.types(exclude_types: [Person]) # if types.empty?
      
      types.reject! do |type|
        # cr = (Array.new(10) { type.new }.map(&:challenge_rating).reduce(&:+) / 10.0).floor
        type.new.challenge_rating > challenge_level - 1
      end

      types.sample.new

      # Creature.generate(place: place, type: types.sample)
    end
  end
end

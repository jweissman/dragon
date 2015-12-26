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
      entity = sample_percentages(type_percentages(place)).call
      until challenge_rating_range(challenge_level).include?(entity.challenge_rating)
        entity = sample_percentages(type_percentages(place)).call
      end
      new(entity)
    end

    def self.challenge_rating_range(challenge_level)
      case challenge_level
        when 1..5   then 0..5
        when 6..10  then 5..10
        when 11..15 then 10..15
        when 15..20 then 15..20
        else
          20..1_000
      end
    end

    def self.type_percentages(place)
      if place.class.populated?
        {
          25 => -> { generate_creature(place) },
          75 => -> { Person.generate }
        }
      else
        {
          85 => -> { generate_creature(place) },
          15 => -> { Person.generate }
        }
      end
    end

    def self.generate_creature(place)
      Creature.generate(place: place)
    end
  end
end

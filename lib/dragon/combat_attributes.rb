module Dragon
  module CombatAttributes
    def stats
      {
        power: power,
        intellect: intellect,
        coordination: coordination,
        resilience: resilience,
        focus: focus,
        calm: calm,
      }
    end

    def upgrade_statistic!(name: nil)
      case name
      when :power then @power += 1
      when :intellect then @intellect += 1
      when :coordination then @coordination += 1
      when :resilience then @resilience += 1
      when :focus then @focus += 1
      when :calm then @calm += 1
      end
    end


    def modifier_for(value)
      case value
        when 0..1   then -5
        when 1..2   then -4
        when 2..4   then -3
        when 4..6   then -2
        when 6..8   then -1
        when 8..10  then 0
        when 10..12 then 1
        when 12..14 then 2
        when 14..16 then 3
        when 16..18 then 4
        when 18..19 then 5
        else
          6
      end
    end


    def base_challenge_rating
      power + intellect + coordination + resilience + focus + calm
    end

    # normalize for 0-20 roughly matching levels
    def challenge_rating
      ((
        ((base_challenge_rating / 6).floor +
         (attack_rating.end + defense_rating.end))
      ) / 2) - 5
    end

    def base_attack_rating
      weapon.damage_range
    end

    def attack_rating
      base_attack_rating + modifier_for(power)
    end

    def base_defense_rating
      if accessories.values.flatten.any?
        armor.deflect_range + deflection_from_accessories
      else
        armor.deflect_range
      end
    end

    def defense_rating
      base_defense_rating + modifier_for(resilience)
    end

    def chance_of_hitting(target)
      accuracy / target.resistance.to_f
    end

    # really a property of a weapon (and maybe size class of target?)
    def base_accuracy
      5
    end

    def accuracy
      base_accuracy + modifier_for(coordination)
    end

    # again really prop of armor (and maybe size class?)
    def base_resistance
      3
    end

    def resistance
      base_resistance + modifier_for(calm)
    end


    def max_hp
      1 + (body * 3.5).floor
    end

    def body
      (resilience + power) / 2
    end

    def power
      @power ||= power_range.to_a.sample
      @power + power_modifier
    end

    def intellect
      @intellect ||= intellect_range.to_a.sample
      @intellect + intellect_modifier
    end

    def coordination
      @coordination ||= coordination_range.to_a.sample
      @coordination + coordination_modifier
    end

    def resilience
      @resilience ||= resilience_range.to_a.sample
      @resilience + resilience_modifier
    end

    def focus
      @focus ||= focus_range.to_a.sample
      @focus + focus_modifier
    end

    def calm
      @calm ||= calm_range.to_a.sample
      @calm + calm_modifier
    end

    def power_range; base_range end
    def resilience_range; base_range end

    def intellect_range; base_range end
    def coordination_range; base_range end

    def focus_range; base_range end
    def calm_range; base_range end

    def base_range
      (0..20)
    end

    def power_modifier; base_modifier end
    def resilience_modifier; base_modifier end

    def intellect_modifier; base_modifier end
    def coordination_modifier; base_modifier end

    def focus_modifier; base_modifier end
    def calm_modifier; base_modifier end

    def base_modifier
      0
    end
  end
end

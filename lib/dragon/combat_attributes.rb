module Dragon
  module CombatAttributes
    def bonus_for(value)
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

    def base_attack_rating
      weapon.damage_range #.to_a.sample # fists
    end

    def attack_rating
      base_attack_rating + bonus_for(power)
    end

    def base_defense_rating
      armor.deflect_range #.to_a.sample
      # 3 # light clothing/fur...
    end

    def defense_rating
      base_defense_rating + bonus_for(resilience)
    end

    def chance_of_hitting(target)
      accuracy / target.resistance.to_f
    end

    def base_accuracy
      5
    end

    def accuracy
      base_accuracy + bonus_for(coordination)
    end

    def base_resistance
      3
    end

    def resistance
      base_resistance + bonus_for(calm)
    end

    def max_hp
      1 + (body * 3.5).floor
    end

    def body
      (resilience + power) / 2
    end

    ##

    def stats
      {
        power: power,
        intellect: intellect,
        coordination: coordination,
        resilience: resilience,
        focus: focus,
        calm: calm
      }
    end

    def total_stat_value
      power + intellect + coordination + resilience + focus + calm
    end

    def power
      @power ||= power_range.to_a.sample
    end

    def intellect
      @intellect ||= intellect_range.to_a.sample
    end

    def coordination
      @coordination ||= coordination_range.to_a.sample
    end

    def resilience
      @resilience ||= resilience_range.to_a.sample
    end

    def focus
      @focus ||= focus_range.to_a.sample
    end

    def calm
      @calm ||= calm_range.to_a.sample
    end

    def power_range; base_range end
    def resilience_range; base_range end

    def intellect_range; base_range end
    def coordination_range; base_range end

    def focus_range; base_range end
    def calm_range; base_range end

    def base_range
      raise 'override in subclass'
    end
  end
end

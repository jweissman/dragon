module Dragon
  # TODO break some of this apart..
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
      when :power        then @power += 1
      when :intellect    then @intellect += 1
      when :coordination then @coordination += 1
      when :resilience   then @resilience += 1
      when :focus        then @focus += 1
      when :calm         then @calm += 1
      end
    end

    def quality_label_for(value)
      case value
      when 0..0    then :terrible
      when 1..2    then :awful
      when 3..4    then :very_poor
      when 5..6    then :poor
      when 7..8    then :fair
      when 9..10   then :average
      when 10..11  then :good
      when 12..13  then :great
      when 14..15  then :excellent
      when 16..17  then :extraordinary
      when 18..19  then :superb
      when 20..100 then :legendary
      end
    end

    def modifier_for(value)
      case quality_label_for(value)
      when :terrible         then -4
      when :awful            then -3
      when :very_poor        then -2
      when :poor             then -1
      when :fair             then 0
      when :average          then 0
      when :good             then 0
      when :great            then 1
      when :excellent        then 2
      when :extraordinary    then 3
      when :superb           then 4
      when :legendary        then 5
      end
    end

    def stat_average
      [ power_range, intellect_range, coordination_range, resilience_range, focus_range, calm_range ].map(&:end).inject(&:+) / 6.0
    end

    def challenge_rating
      ((stat_average * 1.1) - 9).floor
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
      base_defense_rating + modifier_for(resilience) + modifier_for(coordination)
    end

    def chance_of_hitting(target)
      #1.0
      accuracy(target) / target.resistance.to_f
    end

    # really a property of a weapon (and maybe size class of target?)
    def base_accuracy(target)
      (4 * focus) - target.defense_rating.to_a.sample
    end

    def accuracy(target)
      base_accuracy(target) + modifier_for(coordination)
    end

    # again really prop of armor (and maybe size class?)
    def base_resistance
      1 + armor.material.strength_modifier
    end

    def resistance
      base_resistance + modifier_for(calm)
    end

    def max_hp
      (body/2).floor
    end

    def body
      resilience + power
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

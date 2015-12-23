module Dragon
  class Combatant < Entity
    attr_writer :armor, :weapon

    include CombatAttributes
    include Items

    def armor
      @armor ||= default_armor
    end

    def weapon
      @weapon ||= default_weapon
    end

    def wield!(weapon)
      @weapon = weapon
    end

    def wear!(armor)
      @armor = armor
    end

    def default_armor
      raise 'override'
    end

    def default_weapon
      raise 'override'
    end

    def attack!(enemy)
      damage = attack_damage_against(enemy)
      enemy.take_damage!(damage)
      damage
    end

    def take_damage!(damage)
      @hp ||= max_hp
      @hp -= damage
    end

    def heal!
      @hp = max_hp
    end

    def alive?
      hp > 0
    end

    def attack_damage_against(target)
      damage = attack_rating.to_a.sample - (target.defense_rating.to_a.sample)
      damage > 0 ? damage : 1
    end

    def chance_of_hitting(target)
      0.5
    end

    def hp
      @hp ||= max_hp
    end

    def xp
      @xp ||= (challenge_rating ** 0.5).ceil
    end

    def bounty
      @bounty ||= (challenge_rating * 0.75).floor
    end
  end
end

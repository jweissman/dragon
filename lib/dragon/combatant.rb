module Dragon
  class Combatant < Entity
    include CombatAttributes

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
      damage = attack_rating - (target.defense_rating)
      damage > 0 ? damage : 1
    end

    def chance_of_hitting(target)
      0.5
    end

    def hp
      @hp ||= max_hp
    end

    def xp
      @xp ||= 1
    end

    def bounty
      @bounty ||= 1
    end
  end
end

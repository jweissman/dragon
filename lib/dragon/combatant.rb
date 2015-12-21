module Dragon
  
  class Combatant < Entity
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
      attack_rating - target.defense_rating
    end

    def chance_of_hitting(target)
      0.5
    end

    def hp
      @hp ||= max_hp
    end

    def max_hp
      @max_hp ||= 2
    end

    def attack_rating
      @attack_rating ||= 4
    end

    def defense_rating
      @defense_rating ||= 1
    end

    def xp
      @xp ||= 1
    end

    def bounty
      @bounty ||= 1
    end
  end
end

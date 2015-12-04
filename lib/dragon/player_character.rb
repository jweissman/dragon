module Dragon
  class PlayerCharacter < Person

    attr_accessor :action, :inventory

    def self.build(console)
      PlayerBuilder.construct(self, console)
    end

    def hp
      @hp ||= max_hp
    end

    def max_hp
      @max_hp ||= self.default_max_hp_for profession
    end
    
    def alive?
      hp > 0
    end

    def take_damage!(damage)
      hp -= damage
    end

    def attack_rating
      3
    end

    def defense_rating
      2
    end

    def inventory
      @inventory ||= []
    end

    def activity
      @activity ||= :exploring
    end

    def attack_damage_against(enemy)
      attack_rating - enemy.defense_rating
    end

    def self.professions
      %w[ warrior wizard soldier rogue cleric ]
    end

    def self.default_max_hp_for(profession)
      {
        warrior: 25,
        wizard: 8,
        soldier: 20,
        rogue: 15,
        cleric: 12
      }[profession.to_sym]

    end
  end
end

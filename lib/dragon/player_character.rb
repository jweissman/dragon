module Dragon
  class PlayerCharacter < Person
    attr_accessor :action, :inventory

    def self.build(console)
      PlayerBuilder.construct(self, console)
    end

    def attack_rating
      3
    end

    def inventory
      @inventory ||= []
    end

    def activity
      @activity ||= :exploring
    end

    # def damage(enemy)
    #   amount = attack_damage_against(enemy)
    #   enemy.take_damage!(amount) 
    #   amount
    # end

    def attack_damage_against(enemy)
      attack_rating - enemy.defense_rating
    end

    def self.professions
      %w[ warrior wizard soldier rogue cleric ]
    end
  end
end

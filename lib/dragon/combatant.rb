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

    def accessories
      @accessories ||= {}
    end

    def deflection_from_accessories
      accessories.values.flatten.map(&:deflect_range).inject(&:+)
    end

    def wield!(weapon)
      @weapon = weapon
    end

    def wear!(armor)
      @armor = armor
    end

    def equip!(accessory)
      @accessories ||= {}
      @accessories[accessory.type] ||= []
      @accessories[accessory.type].push(accessory)
    end

    def take_off!(accessory)
      @accessories[accessory.type].delete(accessory)
    end

    def can_equip?(accessory)
      return true unless accessories.has_key?(accessory.type)

      !(accessories[accessory.type].include?(accessory)) &&
        accessories[accessory.type].count < accessory.class.maximum_equippable
    end

    def inventory
      @inventory ||= [ default_armor, default_weapon ].reject do |item|
        item.is_a?(NaturalWeapon) || item.is_a?(NaturalArmor)
      end + accessories.values.flatten
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
      base   = attack_rating.to_a.sample
      absorb = (target.defense_rating.to_a.sample / 2).floor
      adjusted = (base - absorb)
      adjusted > 0 ? adjusted : 0
    end

    def hp
      @hp ||= max_hp
    end

    def xp
      @xp ||= 10 + (1.85 * ((2+challenge_rating) ** 3)).floor
    end

    def bounty
      @bounty ||= 3 + (2.5 * ((1+challenge_rating) ** 4)).floor
    end
  end
end

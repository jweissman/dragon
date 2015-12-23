module Dragon
  module Items
    class Gem < Treasure
      def base_cost
        1_000
      end

      def self.materials
        Material.gemstone
      end
    end

    class Equipment < Item
      def self.materials
        [ Steel, Bronze, Iron ]
      end
    end

    class Accessory < Equipment
      def self.materials
        Material.metallic + Material.gemstone
      end
    end

    class Ring < Accessory
      def base_cost
        200
      end
    end

    class Necklace < Accessory
      def base_cost
        450
      end
    end

    class Helm < Equipment
      def base_cost
        50
      end
    end

    class Armor < Equipment
      def self.materials
        [ Steel, Bronze, Iron, Leather ]
      end

      def deflect_range
        base_absorption + material.strength + quality.modifier
      end
    end

    class Clothing < Armor
      def self.materials
        [ Cloth, Leather ]
      end

      def base_cost
        10
      end

      def base_absorption
        (0..1)
      end
    end

    class Plate < Armor
      def self.materials
        [ Iron, Bronze, Steel ]
      end

      def base_cost
        250
      end

      def base_absorption
        (5..8)
      end
    end

    class Suit < Armor
      def base_cost
        400
      end

      def base_absorption
        (7..10)
      end
    end

    class NaturalArmor < Armor
      def quality
        Good.new
      end
    end

    class Fur < NaturalArmor
      def base_absorption
        (2..3)
      end
    end

    class Scales < NaturalArmor
      def base_absorption
        (4..6)
      end
    end

    class Weapon < Equipment
      def damage_range
        base_damage + material.strength + quality.modifier
      end
    end

    class Staff < Weapon
      def self.materials
        [ Wood, Iron, Bronze, Steel ]
      end

      def base_damage
        (2..4)
      end

      def base_cost
        150
      end
    end

    class Dagger < Weapon
      def base_cost
        75
      end

      def base_damage
        (1..4)
      end
    end

    class Sword < Weapon
      def base_cost
        200
      end

      def base_damage
        (3..8)
      end
    end

    class GreatSword < Weapon
      def base_cost
        350
      end

      def base_damage
        (4..12)
      end
    end

    class Axe < Weapon
      def base_cost
        150
      end

      def base_damage
        (3..8)
      end
    end

    class WarHammer < Weapon
      def base_cost
        125
      end

      def base_damage
        (2..11)
      end
    end

    class NaturalWeapon < Weapon
      def quality
        Good.new
      end

      def describe(*)
        label
      end

      def self.materials
        [ Bone ]
      end
    end

    class Claws < NaturalWeapon
      def base_damage
        (1..8)
      end
    end

    class Talons < NaturalWeapon
      def base_damage
        (2..10)
      end
    end

    class Teeth < NaturalWeapon
      def base_damage
        (3..7)
      end
    end

    class Stinger < NaturalWeapon
      def base_damage
        (1..12)
      end

      def describe(*)
        "a stinger"
      end
    end

    class AcidBreath < NaturalWeapon
      def base_damage
        (2..10)
      end
    end

    class Fists < NaturalWeapon
      def self.materials
        [ Flesh ]
      end

      def base_damage
        (1..3)
      end
    end
  end
end

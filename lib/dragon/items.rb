module Dragon
  module Items
    class Treasure < Item; end
    # class Coin < Treasure
    #   def self.materials
    #     Material.metallic
    #   end
    # end

    class Figurine < Treasure
      def base_cost
        15
      end

      def self.materials
        Material.basic + Material.gemstone
      end
    end

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

    class Armor < Equipment
      def self.materials
        [ Steel, Bronze, Iron, Leather ]
      end
    end

    class Helm < Armor
      def base_cost
        600
      end
    end

    class Plate < Armor
      def base_cost
        900
      end
    end

    class Suit < Armor
      def base_cost
        1_500
      end
    end

    class Weapon < Equipment; end
    class Staff < Weapon
      def self.materials
        [ Wood, Iron, Bronze, Steel ]
      end

      def base_cost
        500
      end
    end

    class Dagger < Weapon
      def base_cost
        275
      end
    end

    class Sword < Weapon
      def base_cost
        2_000
      end
    end

    class Axe < Weapon
      def base_cost
        2_500
      end
    end


  end
end

module Dragon
  module Items
    class Ring < Accessory
      def self.materials
        Material.metallic + Material.gemstone
      end

      def base_cost
        200
      end

      def self.maximum_equippable
        2
      end

      def deflect_range
        (0..0)
      end
    end
  end
end

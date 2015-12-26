module Dragon
  module Items
    class Necklace < Accessory
      def self.materials
        Material.metallic + Material.gemstone
      end

      def base_cost
        450
      end

      def deflect_range
        (0..0)
      end
    end
  end
end

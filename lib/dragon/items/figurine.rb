module Dragon
  module Items
    class Figurine < Treasure
      def base_cost
        15
      end

      def self.materials
        Material.basic + Material.gemstone
      end
    end
  end
end

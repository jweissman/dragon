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
  end
end

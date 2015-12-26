module Dragon
  module Items
    class Accessory < Equipment
      def self.materials
        [ Steel, Bronze, Iron, Leather ]
      end

      def self.maximum_equippable
        1
      end

      def base_absorption
        (0..0)
      end

      def deflect_range
        base_absorption + material.strength + quality.modifier
      end
    end
  end
end

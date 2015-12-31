module Dragon
  module Items
    class Armor < Equipment
      def self.materials
        [ Steel,  Iron, Leather ]
      end

      def deflect_range
        base_absorption + 
          material.strength_modifier + 
          quality.modifier
      end
    end
  end
end

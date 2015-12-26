module Dragon
  module Items
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
  end
end

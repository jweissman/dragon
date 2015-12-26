module Dragon
  module Items
    class Skin < NaturalArmor
      def describe(*)
        "no clothes"
      end

      def base_absorption
        (0..1)
      end

      def self.materials
        [ Flesh ]
      end
    end
  end
end

module Dragon
  module Materials
    class Gemstone < Material
      def material_strength
        ExtremelyStrong
      end
    end

    class Pearl < Gemstone
      def cost_multiplier
        50
      end
    end

    class Emerald < Gemstone
      def cost_multiplier
        75
      end
    end

    class Onyx < Material
      def cost_multiplier
        100
      end
    end

    class Ruby < Material
      def cost_multiplier
        250
      end
    end

    class Sapphire < Material
      def cost_multiplier
        200
      end
    end

    class Diamond < Material
      def cost_multiplier
        1_000
      end
    end


  end
end

module Dragon
  module Materials
    class PreciousMetal < Material
      def material_strength
        Weak
      end
    end

    class Copper < PreciousMetal
      def cost_multiplier
        5.0
      end
    end

    class Silver < PreciousMetal
      def cost_multiplier
        10.0
      end
    end

    class Gold < PreciousMetal
      def cost_multiplier
        25.0
      end
    end
  end
end

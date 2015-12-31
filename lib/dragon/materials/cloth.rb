module Dragon
  module Materials
    class Cloth < Material
      def cost_multiplier
        0.2
      end

      def material_strength
        VeryWeak
      end
    end
  end
end

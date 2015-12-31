module Dragon
  module Materials
    class Leather < Material
      def cost_multiplier
        0.65
      end

      def material_strength
        Weak
      end
    end
  end
end

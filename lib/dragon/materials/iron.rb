module Dragon
  module Materials
    class Iron < Material
      def cost_multiplier
        1.0
      end

      def material_strength
        VeryStrong
      end
    end
  end
end

module Dragon
  module Materials
    class Stone < Material
      def cost_multiplier
        0.6
      end

      def material_strength
        VeryStrong
      end
    end
  end
end

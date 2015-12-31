module Dragon
  module Materials
    class Wood < Material
      def cost_multiplier
        0.2
      end

      def material_strength
        Weak
      end
    end
  end
end

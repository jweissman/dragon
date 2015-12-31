module Dragon
  module Materials
    class Steel < Material
      def cost_multiplier
        1.8
      end

      def material_strength
        ExtremelyStrong
      end
    end
  end
end

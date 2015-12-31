module Dragon
  module Materials
    class Bone < Material
      def cost_multiplier
        0
      end

      def material_strength
        Strong
      end
    end
  end
end

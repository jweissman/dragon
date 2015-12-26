module Dragon
  module Creatures
    class Ooze < Creature
      tagged :evil

      def self.size_class
        VerySmall
      end

      def default_weapon
        @default_weapon ||= AcidBreath.new
      end
    end
  end
end

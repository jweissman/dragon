module Dragon
  module Creatures
    class Ooze < Creature
      tagged :evil

      def self.spirit_class
        LowSpirited
      end

      def self.mind_class
        Dimwitted
      end

      def self.size_class
        VerySmall
      end

      def default_weapon
        @default_weapon ||= AcidBreath.new
      end
    end
  end
end

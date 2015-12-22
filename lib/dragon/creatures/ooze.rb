module Dragon
  module Creatures
    class Ooze < Creature
      tagged :evil

      def self.max_hp
        15
      end

      def default_weapon
        @default_weapon ||= AcidBreath.new
      end
    end
  end
end

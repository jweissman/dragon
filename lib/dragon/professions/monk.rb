module Dragon
  module Professions
    class Monk < Adventurer
      tagged :holy, :praying, :kneeling, :religious, :clergy

      def default_weapon
        @default_weapon ||= Fists.new
      end

      def resilience_range
        (12..14)
      end

      def focus_range
        (15..18)
      end

      def power_modifier
        super + fist_bonus
      end

      def fist_bonus
        if weapon.is_a?(Fists)
          (2*modifier_for(focus))
        else
          -2
        end
      end
    end
  end
end

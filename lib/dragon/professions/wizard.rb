module Dragon
  module Professions
    class Wizard < Adventurer
      tagged :magic, :spellcasting, :lore

      def default_weapon
        @default_weapon ||= Staff.new
      end

      def focus_range
        (12..14)
      end

      def intellect_range
        (15..18)
      end

      def power_modifier
        super + staff_bonus
      end

      def staff_bonus
        if weapon.is_a?(Staff)
          modifier_for(intellect)
        else
          -2
        end
      end
    end
  end
end

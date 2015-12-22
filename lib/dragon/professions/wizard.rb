module Dragon
  module Professions
    class Wizard < Adventurer
      tagged :magic, :spellcasting, :lore

      def default_weapon
        @default_weapon ||= Staff.new
      end

      def focus_range
        (15..18)
      end

      def intellect_range
        (15..18)
      end

      def calm_range
        (13..16)
      end

      def resilience_range
        (10..12)
      end

      def power_range
        (10..12)
      end
    end
  end
end

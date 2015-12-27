module Dragon
  module Professions
    class Wizard < Adventurer
      tagged :magic, :spellcasting, :lore

      primary :intellect
      secondary :focus
      weak :resilience

      def default_weapon
        @default_weapon ||= Staff.new
      end

      def power_modifier
        super + staff_bonus
      end

      def staff_bonus
        if weapon.is_a?(Staff)
          modifier_for(person.intellect)
        else
          -2
        end
      end
    end
  end
end

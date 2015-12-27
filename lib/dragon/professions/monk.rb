module Dragon
  module Professions
    class Monk < Adventurer
      tagged :holy, :praying, :kneeling, :religious, :clergy

      primary :focus
      secondary :intellect
      weak :resilience

      def default_weapon
        @default_weapon ||= Fists.new
      end

      def power_modifier
        super + fist_bonus
      end

      def fist_bonus
        if weapon.is_a?(Fists)
          modifier_for(person.focus)
        else
          -2
        end
      end
    end
  end
end

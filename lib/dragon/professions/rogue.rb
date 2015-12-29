module Dragon
  module Professions
    class Rogue < Adventurer
      tagged :crime, :dark, :evil, :stealing

      primary :coordination
      secondary :power
      weak :resilience

      def default_weapon
        @default_weapon ||= Dagger.new(material: person.class.default_weapon_material)
      end

      def power_modifier
        super + dagger_bonus
      end

      def dagger_bonus
        if weapon.is_a?(Dagger)
          modifier_for person.coordination
        else
          -2
        end
      end
    end
  end
end

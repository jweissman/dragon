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
    end
  end
end

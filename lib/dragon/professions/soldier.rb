module Dragon
  module Professions
    class Soldier < Adventurer
      tagged :military, :army, :fighting, :brawling, :law
      
      primary :power
      secondary :focus
      weak :intellect

      def default_weapon
        @default_weapon ||= Axe.new(material: person.class.default_weapon_material)
      end
    end
  end
end

module Dragon
  module Professions
    class Warrior < Adventurer
      tagged :fighting, :brawling

      primary :power
      secondary :focus
      weak :calm

      def default_weapon
        @default_weapon ||= Sword.new(material: person.class.default_weapon_material)
      end
    end
  end
end

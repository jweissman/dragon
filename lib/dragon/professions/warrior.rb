module Dragon
  module Professions
    class Warrior < Adventurer
      tagged :fighting, :brawling

      primary :focus
      secondary :power
      weak :calm

      def default_weapon
        @default_weapon ||= Sword.new(material: person.class.default_weapon_material)
      end
    end
  end
end

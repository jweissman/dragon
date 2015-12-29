module Dragon
  module Professions
    class Paladin < Adventurer
      tagged :holy, :praying, :fighting, :religious, :zeal

      primary :focus
      secondary :resilience
      weak :calm

      def default_weapon
        @default_weapon ||= Sword.new(material: person.class.default_weapon_material)
      end
    end
  end
end

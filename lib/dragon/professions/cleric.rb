module Dragon
  module Professions
    class Cleric < Adventurer
      tagged :holy, :healing, :praying, :religious

      primary :intellect
      secondary :calm
      weak :coordination

      def default_weapon
        @default_weapon ||= WarHammer.new(material: Iron.new)
      end
    end
  end
end

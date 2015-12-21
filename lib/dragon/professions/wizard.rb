module Dragon
  module Professions
    class Wizard < Adventurer
      tagged :magic, :spellcasting, :lore

      def default_max_hp
        14
      end
    end
  end
end

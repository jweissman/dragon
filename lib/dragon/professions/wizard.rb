module Dragon
  module Professions
    class Wizard < Adventurer
      tagged :magic

      def default_max_hp
        14
      end
    end
  end
end

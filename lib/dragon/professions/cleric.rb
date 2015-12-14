module Dragon
  module Professions
    class Cleric < Adventurer
      tagged :holy
      def default_max_hp
        16
      end
    end
  end
end

module Dragon
  module Professions
    class Cleric < Adventurer
      tagged :holy, :healing, :praying, :religious

      def default_max_hp
        16
      end
    end
  end
end

module Dragon
  module Professions
    class Cleric < Adventurer
      tagged :holy, :healing, :praying, :religious

      def resilience_range
        (8..10)
      end
    end
  end
end

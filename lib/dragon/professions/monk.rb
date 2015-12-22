module Dragon
  module Professions
    class Monk < Adventurer
      tagged :holy, :praying, :kneeling, :religious, :clergy

      def resilience_range
        (12..14)
      end
    end
  end
end

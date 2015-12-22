module Dragon
  module Professions
    class Paladin < Adventurer
      tagged :holy, :praying, :fighting, :religious

      def resilience_range
        (14..16)
      end

      def focus_range
        (14..16)
      end
    end
  end
end

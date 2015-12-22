module Dragon
  module Professions
    class Cleric < Adventurer
      tagged :holy, :healing, :praying, :religious

      def default_weapon
        @default_weapon ||= WarHammer.new
      end

      def resilience_range
        (8..10)
      end
    end
  end
end

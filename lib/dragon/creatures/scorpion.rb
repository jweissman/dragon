module Dragon
  module Creatures
    class Scorpion < Arachnid
      def resilience_range
        (5..8)
      end

      def default_weapon
        Stinger.new
      end
    end
  end
end

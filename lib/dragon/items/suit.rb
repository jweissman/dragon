module Dragon
  module Items
    class Suit < Armor
      def base_cost
        400
      end

      def base_absorption
        (9..10)
      end
    end
  end
end

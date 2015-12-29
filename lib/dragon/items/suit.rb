module Dragon
  module Items
    class Suit < Armor
      def base_cost
        400
      end

      def base_absorption
        (1..3)
      end
    end
  end
end

module Dragon
  module Commands
    class WearArmorCommand < Command
      include Items

      attr_reader :player, :armor
      def initialize(player: nil, armor: nil)
        @player = player
        @armor = armor
      end

      def label
        pc = player.clone
        pc.wear!(armor)

        "Wear #{armor.describe} (#{pc.defense_rating})"
      end

      def describe
        "You wear #{armor.describe}"
      end
    end
  end
end

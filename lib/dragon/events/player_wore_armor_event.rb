module Dragon
  module Events
    class PlayerWoreArmorEvent < Event
      attr_reader :player, :armor
      def initialize(player: nil, armor: nil)
        @player = player
        @armor = armor
      end

      def describe
        "#{player.name} wore #{armor.label} (defense rating is now #{player.defense_rating})"
      end
    end
  end
end

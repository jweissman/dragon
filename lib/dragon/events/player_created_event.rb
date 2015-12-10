module Dragon
  module Events
    class PlayerCreatedEvent < Event
      attr_reader :player

      def initialize(player: nil)
        @player = player
      end

      def describe
        "You are #{player.describe}"
      end
    end
  end
end

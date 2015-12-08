module Dragon
  module Events
    class PlayerCreatedEvent < Event
      attr_reader :player

      def initialize(player: nil)
        @player = player
      end

      def describe
        "#{player.describe} entered the realms"
      end
    end
  end
end

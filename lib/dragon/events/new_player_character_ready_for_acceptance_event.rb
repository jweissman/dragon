module Dragon
  module Events
    class NewPlayerCharacterReadyForAcceptanceEvent < Event
      attr_reader :player

      def initialize(player: nil)
        @player = player
      end

      def describe
        "Has the story of #{player.describe} just begun?"
      rescue
        "A new story has begun..."
      end

      def actions
        [
          create_pc(player),
          new_pc(label: "Make a new hero"),
          generate_pc(label: "Make up a different hero for me")
        ]
      end
    end
  end
end

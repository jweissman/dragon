module Dragon
  module Events
    class NewPlayerCharacterReadyForAcceptanceEvent < Event
      attr_reader :player

      def initialize(player: nil)
        @player = player
      end

      def describe
        if player.name.nil?
          "Is this the story of #{player.describe}?"
        else
          "Has a new story just begun?"
        end
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

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
          Dragon::Commands::CreatePlayerCharacterCommand.new(
            name: player.name,
            age: player.age,
            gender: player.gender,
            race: player.race,
            subtype: player.subtype,
            profession: player.profession
          ),

          Dragon::Commands::NewPlayerCharacterCommand.new(label: "Make a different hero"),

          Dragon::Commands::GeneratePlayerCharacterCommand.new(label: "Make up a different hero for me")
        ]
      end
    end
  end
end

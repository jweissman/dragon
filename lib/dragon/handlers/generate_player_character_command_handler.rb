module Dragon
  module Handlers
    class GeneratePlayerCharacterCommandHandler < CommandHandler
      def handle(command)
        player = PlayerCharacter.generate
        
        NewPlayerCharacterReadyForAcceptanceEvent.new(player: player)
      end
    end
  end
end

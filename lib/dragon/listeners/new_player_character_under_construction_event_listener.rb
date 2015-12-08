module Dragon
  module Listeners
    class NewPlayerCharacterUnderConstructionEventListener < EventListener
      def on(event)
        player = PlayerBuilder.construct( PlayerCharacter, console: engine.terminal.console)

        Dragon::Events::NewPlayerCharacterReadyForAcceptanceEvent.new(player: player)
      end
    end
  end
end

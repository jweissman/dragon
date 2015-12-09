module Dragon
  module Handlers
    class CreatePlayerCharacterCommandHandler < CommandHandler
      def handle(command)
        # we have to assume this command is 'right'
        # and that the web engine has injected its params
        engine.player.name       = command.name
        engine.player.age        = command.age
        engine.player.gender     = command.gender
        engine.player.race       = command.race
        engine.player.subtype    = command.subtype
        engine.player.profession = command.profession

        transition_to exploration

        PlayerCreatedEvent.new(player: engine.player)
      end

      def event_bus
        @bus = EventBus.instance
      end
    end
  end
end

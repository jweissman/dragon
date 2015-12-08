module Dragon
  module Handlers
    class FleeCommandHandler < CommandHandler
      def handle(command)
        enemy = command.enemy

        transition_to(exploration)

        events = [
          FledCombatEvent.new(enemy: enemy)
        ]

        if engine.last_destination
          events.push(RandomEncounterResolvedEvent.new(destination: engine.last_destination, current_place: engine.place))
        end

        events
      end
    end
  end
end

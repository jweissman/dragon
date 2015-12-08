module Dragon
  module Handlers
    class SayGoodbyeCommandHandler < CommandHandler
      def handle(command)
        partner = command.partner

        transition_to(exploration)

        events = [
          WordsSpokenEvent.new(person: partner, message: "Farewell!")
        ]

        if engine.last_destination
          events.push(RandomEncounterResolvedEvent.new(destination: engine.last_destination, current_place: engine.place))
        end

        events
      end
    end
  end
end

module Dragon
  module Handlers
    class IgnorePersonCommandHandler < CommandHandler
      def handle(command)
        person = command.person
        events = [ WordsSpokenEvent.new(person: person, message: "Well, ignore me if you like!") ]

        if engine.last_destination
          events.push(RandomEncounterResolvedEvent.new(destination: engine.last_destination, current_place: engine.place))
        end

        events
      end
    end
  end
end

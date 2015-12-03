module Dragon
  module Handlers
    class IgnorePersonCommandHandler < CommandHandler
      def handle(command)
        person = command.person
        WordsSpokenEvent.new(person: person, message: "Well, ignore me if you like!")
      end
    end
  end
end

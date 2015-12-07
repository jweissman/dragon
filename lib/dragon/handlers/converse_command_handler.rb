module Dragon
  module Handlers
    class ConverseCommandHandler < CommandHandler
      def handle(command)
        person = command.person

        if rand > 0.1
          conversation = conversation_with(person)

          transition_to(conversation)

          WordsSpokenEvent.new(person: person, message: 'Greetings!')
        else
          WordsSpokenEvent.new(person: person, message: "Sorry, I'm busy right now")
        end
      end
    end
  end
end

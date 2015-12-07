module Dragon
  module Handlers
    class SayGoodbyeCommandHandler < CommandHandler
      def handle(command)
        partner = command.partner
        transition_to(initial_scene)
        WordsSpokenEvent.new(person: partner, message: "Farewell!")
      end
    end
  end
end

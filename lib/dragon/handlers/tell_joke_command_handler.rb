module Dragon
  module Handlers
    class TellJokeCommandHandler < CommandHandler
      def handle(command)
        partner = command.partner
        subject = command.subject

        response = if partner.profession == subject
          negative_responses(subject).sample
        else
          positive_responses(subject).sample
        end

        WordsSpokenEvent.new(person: partner, message: response)
        #"#{partner.label} says \"#{response}\""
      end

      def negative_responses(subject)
        [
          "I'll have you know that isn't very funny!",
          "Hey, you know *I'M* a #{subject}, right?"
        ]
      end

      def positive_responses(subject)
        [
          "That's a good one!",
          "Ha! Silly #{subject}s.",
          "Thou art hilarious!",
          "You're funny.",
          "Hehehehe!"
        ]
      end
    end
  end
end

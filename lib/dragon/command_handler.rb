module Dragon
  class CommandHandler < Struct.new(:engine)
  end

  class ExitGameCommandHandler < CommandHandler
    def handle(command)
      engine.halt!
      "Well bye!"
    end
  end

  class VisitCommandHandler < CommandHandler
    def handle(command)
      place = infer_destination_from command.place
      engine.move_to(place)
      "You visit #{place.describe}"
    end

    protected
    def infer_destination_from(place)
      if place.is_a?(Building)
        place.rooms.sample
      else
        place
      end
    end
  end

  class EgressCommandHandler < CommandHandler
    def handle(command)
      area = command.place.building.town.areas.first
      engine.move_to area
      "You walk to #{area.describe}"
    end
  end

  class ConverseCommandHandler < CommandHandler
    def handle(command)
      if rand > 0.1
        conversation = engine.conversation_with(command.partner)
        engine.transition_to(conversation)
        "#{command.partner.label} greets you"
      else
        "#{command.partner.label} does not seem to be feel like talking right now"
      end
    end
  end

  class TellJokeCommandHandler < CommandHandler
    def handle(command)
      partner = command.partner
      subject = command.subject

      response = if partner.profession == subject
        negative_responses(subject).sample
      else
        positive_responses(subject).sample
      end

      "#{partner.label} says \"#{response}\""
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

  class AskQuestionCommandHandler < CommandHandler
    def handle(command)
      partner = command.partner
      topic   = command.topic

      response = if topic.is_a?(Place)
        "I love it! #{topic.describe} is great"
      else
        topic.responses.sample
      end

      "#{partner.label} says \"#{response}\""
    end
  end

  class SayGoodbyeCommandHandler < CommandHandler
    def handle(command)
      partner = engine.scene.partner
      engine.transition_to(engine.initial_scene)
      "#{partner.label} says \"Farewell!\""
    end
  end
end

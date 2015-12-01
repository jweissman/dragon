module Dragon
  class Command
    def self.handler(engine)
      Object.const_get(self.name + "Handler").new(engine)
    end
  end

  class ExitGameCommand < Command
    def label
      "Leave the realms"
    end

    def describe
      "You find a quiet place to rest"
    end
  end

  class ConverseCommand < Command
    attr_reader :partner

    def initialize(partner: nil)
      @partner = partner
    end

    def describe
      "You greet #{@partner.name}."
    end

    def label
      "Speak with #{@partner.name}"
    end
  end

  class TellJokeCommand < Command
    attr_reader :partner, :subject

    def initialize(partner: nil, subject: nil)
      @subject = subject
      @partner = partner
    end

    def describe
      "You tell a joke about #{@subject}s"
    end

    def label
      "Joke about #{@subject}s"
    end
  end

  class AskQuestionCommand < Command
    attr_reader :partner, :topic
    def initialize(partner: nil, topic: nil)
      @partner = partner
      @topic = topic
    end

    def describe
      "You ask #{@partner.name} about #{@topic.describe}"
    end

    def label
      "Ask about #{@topic.describe}"
    end
  end

  class SayGoodbyeCommand < Command
    attr_reader :partner

    def initialize(partner: nil)
      @partner = partner
    end

    def describe
      "You say goodbye to #{@partner.name}"
    end

    def label
      "Say goodbye to #{@partner.name}"
    end
  end

  class VisitCommand < Command
    attr_reader :place

    def initialize(place: nil)
      @place = place
    end

    def label
      "Visit #{place.describe}"
    end

    def describe
      "You walk to #{place.describe}"
    end
  end

  class EgressCommand < Command
    attr_reader :place
    def initialize(place: nil)
      @place = place
    end

    def label
      "Leave #{place.building.describe}"
    end

    def describe
      "You leave the #{place.building.describe}"
    end
  end

end

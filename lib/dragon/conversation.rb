module Dragon
  class Conversation < Scene
    attr_reader :partner

    def with(partner: nil)
      @partner = partner
      self
    end 

    def describe
      "talking with #{partner.name}"
    end

    def actions(place)
      basic_conversational_actions +
        general_conversational_actions(place) + 
        personal_actions
    end

    protected
    def personal_actions
      @partner.conversation_topics.map do |topic|
        AskQuestionCommand.new(topic: topic, partner: @partner)
      end
    end

    def general_conversational_actions(place)
      [
        AskQuestionCommand.new(topic: place, partner: @partner)
      ]
    end

    def basic_conversational_actions
      [ 
        TellJokeCommand.new(subject: Person.professions.sample, partner: @partner),
        SayGoodbyeCommand.new(partner: @partner)
      ]
    end
  end
end

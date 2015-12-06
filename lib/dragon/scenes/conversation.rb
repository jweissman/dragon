module Dragon
  module Scenes
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
        if event_actions.any?
          event_actions
        else
          personal_actions(place) + 
            basic_conversational_actions(place)
        end
      end

      protected
      def personal_actions(place)
        @partner.conversation_topics(place).map do |topic|
          AskQuestionCommand.new(topic: topic, partner: @partner)
        end
      end

      def basic_conversational_actions(place)
        [
          TellJokeCommand.new(subject: Profession.all.sample.new, partner: @partner),
          SayGoodbyeCommand.new(partner: @partner)
        ]
      end
    end
  end
end

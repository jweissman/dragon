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
          partner.actions(player) +
            questions_to_ask(place) + 
            basic_conversational_actions(place)
        end
      end

      protected
      def questions_to_ask(place)
        partner.questions(place).map do |question|
          ask_question(question, partner)
        end
      end

      def ask_question(question, partner)
        AskQuestionCommand.new(question: question, partner: partner)
      end

      def basic_conversational_actions(place)
        [
          TellJokeCommand.new(subject: Profession.all.sample.new, partner: partner),
          SayGoodbyeCommand.new(partner: partner)
        ]
      end
    end
  end
end

module Dragon
  module Scenes
    class Conversation < Scene
      attr_reader :partner
      attr_reader :topic

      def with(partner: nil)
        @partner = partner
        @topic = NullTopic.new
        self
      end

      def describe
        topic.describe(partner)
      end

      def change_topic!(new_topic)
        @topic = new_topic
      end

      def actions(place)
        if event_actions.any?
          event_actions
        elsif topic_actions.any?
          (topic_actions + change_topic_actions).flatten.compact
        else
          partner.actions(player) +
            questions_to_ask(place) +
            basic_conversational_actions(place) +
            change_topic_actions
        end
      end

      protected
      def topic_actions
        topic.actions(partner)
      end

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

      def change_topic_actions
        topics = ((partner.conversation_topics - [topic]) + [NullTopic]).uniq

        topic_actions = topics.map do |topic_class|
          if !topic.is_a?(topic_class)
            ChangeConversationSubjectCommand.new(
              partner: partner,
              new_subject: topic_class.new,
              conversation: self
            )
          else
            nil
          end
        end

        topic_actions.compact
      end
    end
  end
end

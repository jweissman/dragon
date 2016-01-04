module Dragon
  module Scenes
    class Conversation < Scene
      attr_reader :partner
      attr_reader :topic

      def with(partner: nil)
        @partner = partner
        @topic = Topics::NullTopic.new(partner: @partner)

        self
      end

      def show_gold?
        topic.show_gold?
      end

      def show_items?
        topic.show_items?
      end

      def describe
        topic.describe
      end

      def change_topic!(new_topic)
        @topic = new_topic
      end

      def actions(place)
        if topic_actions.any?
          (topic_actions + change_topic_actions).flatten.compact
        else
          core_actions(place).flatten.compact
        end
      end

      def core_actions(place)
        [
          partner.actions(player),
          change_topic_actions,
          questions_to_ask(place),
          basic_conversational_actions(place),
        ]
      end

      protected
      def topic_actions
        topic.actions(world)
      end

      def questions_to_ask(place)
        partner.questions(place).map do |question|
          ask_question(question, partner)
        end
      end

      def basic_conversational_actions(place)
        [
          tell_joke(partner),
          say_goodbye(partner)
        ]
      end

      def change_topic_actions
        topics.map do |topic_class|
          if !topic.is_a?(topic_class)
            change_subject(partner, self, topic_class)
          else
            nil
          end
        end
      end

      private
      def topics
        ((partner.conversation_topics - [topic]) + [Topics::NullTopic]).uniq
      end
    end
  end
end

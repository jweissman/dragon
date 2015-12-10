module Dragon
  module Commands
    class ChangeConversationSubjectCommand < Command
      attr_reader :partner, :new_subject, :conversation

      def initialize(partner: nil, new_subject: nil, conversation: nil)
        @partner = partner
        @new_subject = new_subject
        @conversation = conversation
      end

      def describe
        if new_subject.is_a?(Topics::NullTopic)
          "You stop #{conversation.topic.describe}"
        else
          "You start #{new_subject.describe}"
        end
      end

      def label
        if new_subject.is_a?(Topics::NullTopic)
          "Stop #{conversation.topic.describe}"
        else
          "Start #{new_subject.describe}"
        end
      end
    end
  end
end

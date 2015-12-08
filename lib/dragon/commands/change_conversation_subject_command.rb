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
        "You are #{new_subject.describe(partner)}"
      end

      def label
        if new_subject.is_a?(NullTopic)
          "Stop #{conversation.topic.describe(partner)}"
        else
          "Start #{new_subject.describe(partner)}"
        end
      end
    end
  end
end

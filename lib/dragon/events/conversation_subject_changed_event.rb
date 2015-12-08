module Dragon
  module Events
    class ConversationSubjectChangedEvent < Event
      attr_reader :subject, :partner

      def initialize(subject: nil, partner: nil)
        @subject = subject
        @partner = partner
      end

      def describe
        "The topic of your conversation with #{partner.name} has shifted to #{subject.describe(partner)}"
      end
    end
  end
end

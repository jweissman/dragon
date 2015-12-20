module Dragon
  module Events
    class ConversationSubjectChangedEvent < Event
      attr_reader :subject, :partner

      def initialize(subject: nil, partner: nil)
        @subject = subject
        @partner = partner
      end

      def describe
        "You and #{partner.name} are #{subject.label}"
      end
    end
  end
end

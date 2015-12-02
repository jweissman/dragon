module Dragon
  module Commands
    class TellJokeCommand < Command
      attr_reader :partner, :subject

      def initialize(partner: nil, subject: nil)
        @subject = subject
        @partner = partner
      end

      def describe
        "You tell #{@partner.name} a joke about #{@subject}s"
      end

      def label
        "Joke about #{@subject}s"
      end
    end
  end
end

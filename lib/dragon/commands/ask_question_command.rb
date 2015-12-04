module Dragon
  module Commands
    class AskQuestionCommand < Command
      attr_reader :partner, :topic

      def initialize(partner: nil, topic: nil)
        @partner = partner
        @topic = topic
      end

      def describe
        "You ask #{@partner.name} #{@topic.describe}"
      end

      def label
        "Ask #{@partner.name} #{@topic.describe}"
      end
    end
  end
end

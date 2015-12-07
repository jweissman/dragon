module Dragon
  module Commands
    class AskQuestionCommand < Command
      attr_reader :partner, :question

      def initialize(partner: nil, question: nil)
        @partner = partner
        @question = question
      end

      def describe
        "You ask #{partner.name} #{question.describe}"
      end

      def label
        "Ask #{partner.name} #{question.describe}"
      end
    end
  end
end

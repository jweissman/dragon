module Dragon
  module Commands
    class ConverseCommand < Command
      attr_reader :partner

      def initialize(partner: nil)
        @partner = partner
      end

      def describe
        "You greet #{@partner.name}."
      end

      def label
        "Speak with #{@partner.name}"
      end
    end
  end
end

module Dragon
  module Commands
    class SayGoodbyeCommand < Command
      attr_reader :partner

      def initialize(partner: nil)
        @partner = partner
      end

      def describe
        "You say goodbye to #{@partner.name}"
      end

      def label
        "Say goodbye to #{@partner.name}"
      end
    end
  end
end

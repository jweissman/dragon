module Dragon
  module Commands
    class PlaceWagerCommand < Command
      attr_reader :outcome, :outcome_set, :amount, :partner

      def initialize(outcome: nil, outcome_set: [], amount: nil, partner: nil)
        @outcome = outcome
        @outcome_set = outcome_set
        @amount = amount
        @partner = partner
      end

      def label
        "Place #{amount} gold wager on #{outcome} (#{probability}%)"
      end

      def describe
        "You place a #{amount} gold wager on #{outcome}"
      end

      def probability
        (1.0 / outcome_set.count) * 100
      end
    end
  end
end

module Dragon
  module Events
    class GamblingVictoryEvent < Event
      attr_reader :amount, :outcome

      def initialize(amount: nil, outcome: nil)
        @amount = amount
        @outcome = outcome
      end

      def describe
        "You correctly predicted the outcome #{outcome}, so you win #{amount}"
      end
    end
  end
end

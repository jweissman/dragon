module Dragon
  module Events
    class GamblingLossEvent < Event
      attr_reader :amount, :actual_outcome, :wagered_outcome

      def initialize(amount: nil, actual_outcome: nil, wagered_outcome: nil)
        @amount = amount
        @actual_outcome = actual_outcome
        @wagered_outcome = wagered_outcome
      end

      def describe
        "You incorrectly predicted #{wagered_outcome}, but it was actually #{actual_outcome}, so you lose #{amount}"
      end
    end
  end
end

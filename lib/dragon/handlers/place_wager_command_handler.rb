module Dragon
  module Handlers
    class PlaceWagerCommandHandler < CommandHandler
      def handle(command)
        wagered_outcome = command.outcome
        wagered_amount = command.amount
        outcome_set = command.outcome_set

        actual_outcome = outcome_set.sample

        if actual_outcome == wagered_outcome
          player.gold += wagered_amount
          GamblingVictoryEvent.new(amount: wagered_amount, outcome: actual_outcome)
        else
          player.gold -= wagered_amount
          GamblingLossEvent.new(amount: wagered_amount, actual_outcome: actual_outcome, wagered_outcome: wagered_outcome)
        end
      end
    end
  end
end

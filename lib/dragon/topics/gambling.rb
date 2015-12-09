module Dragon
  module Topics
    class Gambling < ConversationTopic
      attr_reader :wager_amount

      def initialize(*args)
        @wager_amount = 2
        super(*args)
      end

      def describe
        "gambling with #{partner.name}"
      end

      def actions(*)
        wager_actions
      end

      def wager_actions
        outcomes.map do |outcome|
          Dragon::Commands::PlaceWagerCommand.new(
            outcome:     outcome,
            outcome_set: outcomes,
            amount:      wager_amount,
            partner:     partner
          )
        end
      end

      def outcomes
        %w[ heads tails ]
      end
    end
  end
end

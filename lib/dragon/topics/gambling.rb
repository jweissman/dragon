module Dragon
  module Topics
    class Gambling < ConversationTopic
      attr_reader :wager_amount

      def initialize(*args)
        @wager_amount = 5

        super(*args)
      end

      def describe
        "gambling with #{partner.name}"
      end

      def show_gold?
        true
      end

      def actions(*)
        wager_actions
      end

      def wager_actions
        outcomes.map do |outcome|
          wager(outcome, outcomes, wager_amount, partner)
        end
      end

      def outcomes
        %w[ heads tails ]
      end
    end
  end
end

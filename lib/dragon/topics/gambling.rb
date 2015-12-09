module Dragon
  module Topics
    class Gambling < ConversationTopic
      attr_reader :pot, :wager_amount

      def initialize
        @pot = 0
        @wager_amount = 2
      end

      def describe
        "gambling with #{partner.name}"
      end

      def actions
        outcomes.map do |outcome|
          PlaceWager.new(on: outcome, amount: wager_amount)
        end
        # [
        #   PlaceWager.new(on: 'heads', amount: wager_amount),
        #   PlaceWager.new(on: 'tails', amount: wager_amount)
        #   # place wager
        # ]
      end
      def outcomes
        %w[ heads tails ]
      end
    end



  end
end

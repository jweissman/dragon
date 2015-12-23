module Dragon
  module Events
    class PlayerLevelledUpEvent < Event
      attr_reader :player

      def initialize(player: nil)
        @player = player
      end

      def describe
        "#{player} advanced to level #{player.level}"
      end

      def actions
        player.stats.keys.map do |stat_name|
          upgrade_statistic(player, stat_name)
        end
      end
    end
  end
end

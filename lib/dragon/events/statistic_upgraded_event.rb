module Dragon
  module Events
    class StatisticUpgradedEvent < Event
      attr_reader :player, :stat_name

      def initialize(player: nil, stat_name: nil)
        @player = player
        @stat_name = stat_name
      end

      def describe
        "#{player.name}'s #{stat_name} increased to #{upgraded_value}"
      end

      def upgraded_value
        player.stats[stat_name]
      end
    end
  end
end

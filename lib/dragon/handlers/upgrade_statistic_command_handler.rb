module Dragon
  module Handlers
    class UpgradeStatisticCommandHandler < CommandHandler
      def handle(command)
        player    = command.player
        stat_name = command.stat_name

        player.upgrade_statistic!(name: stat_name)

        [
          StatisticUpgradedEvent.new(player: player, stat_name: stat_name),
          PlayerReflectedEvent.new(player: player)
        ]
      end
    end
  end
end

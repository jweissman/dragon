module Dragon
  module Handlers
    class EngageCombatantCommandHandler < CommandHandler
      def handle(command)
        enemy = command.enemy

        transition_to combat_with(enemy)

        CombatEngagedEvent.new(enemy: enemy)
      end
    end
  end
end

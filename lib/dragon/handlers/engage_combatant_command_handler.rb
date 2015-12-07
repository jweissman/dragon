module Dragon
  module Handlers
    class EngageCombatantCommandHandler < CommandHandler
      def handle(command)
        enemy = command.enemy

        transition_to combat_with(enemy)

        Dragon::Events::CombatEngagedEvent.new(enemy: enemy)
      end
    end
  end
end

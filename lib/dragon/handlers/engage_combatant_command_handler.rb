module Dragon
  module Handlers
    class EngageCombatantCommandHandler < CommandHandler
      def handle(command)
        enemy = command.enemy
        combat = engine.combat_with(enemy)

        engine.transition_to(combat)

        Dragon::Events::CombatEngagedEvent.new(enemy: enemy)
      end
    end
  end
end

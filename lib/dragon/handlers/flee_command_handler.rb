module Dragon
  module Handlers
    class FleeCommandHandler < CommandHandler
      def handle(command)
        enemy = command.enemy

        transition_to(initial_scene)

        FledCombatEvent.new(enemy: enemy)
      end
    end
  end
end

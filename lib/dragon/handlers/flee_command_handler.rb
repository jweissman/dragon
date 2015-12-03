module Dragon
  module Handlers
    class FleeCommandHandler < CommandHandler
      def handle(command)
        enemy = command.enemy

        engine.transition_to(engine.initial_scene)

        FledCombatEvent.new(enemy: enemy)
      end
    end
  end
end

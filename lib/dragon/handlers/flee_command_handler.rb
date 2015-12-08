module Dragon
  module Handlers
    class FleeCommandHandler < CommandHandler
      def handle(command)
        enemy = command.enemy

        transition_to(exploration)

        FledCombatEvent.new(enemy: enemy)
      end
    end
  end
end

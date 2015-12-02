module Dragon
  module Handlers
    class SayGoodbyeCommandHandler < CommandHandler
      def handle(command)
        partner = engine.scene.partner
        engine.transition_to(engine.initial_scene)
        "#{partner.label} says \"Farewell!\""
      end
    end
  end
end

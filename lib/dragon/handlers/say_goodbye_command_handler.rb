module Dragon
  module Handlers
    class SayGoodbyeCommandHandler < CommandHandler
      def handle(command)
        partner = engine.scene.partner
        engine.transition_to(engine.initial_scene)
        WordsSpokenEvent.new(person: partner, message: "Farewell!")
      end
    end
  end
end

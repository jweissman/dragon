module Dragon
  module Listeners
    class RandomEncounterResolvedEventListener < EventListener
      def on(event)
        # clear out last_destination which we use
        # as a flag to indicate we are in a random encounter...
        engine.last_destination = nil
      end
    end
  end
end

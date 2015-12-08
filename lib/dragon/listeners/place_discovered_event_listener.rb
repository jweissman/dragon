module Dragon
  module Listeners
    class PlaceDiscoveredEventListener < EventListener
      def on(event)
        engine.move_to(event.place)

        []
      end
    end
  end
end

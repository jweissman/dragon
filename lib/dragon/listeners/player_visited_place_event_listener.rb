module Dragon
  module Listeners
    class PlayerVisitedPlaceEventListener < EventListener
      def receive(event)
        puts "---> Player visited place event listener!"
        place = event.place

        puts "---> player is at place: #{place}"
      end
    end
  end
end

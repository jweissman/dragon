module Dragon
  module Handlers
    class WanderCommandHandler < CommandHandler
      def handle(command)
        place = command.place
        RandomEvent.sample(place, place.city)
      end
    end
  end
end

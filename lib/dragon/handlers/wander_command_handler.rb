module Dragon
  module Handlers
    class WanderCommandHandler < CommandHandler
      def handle(command)
        place = command.place
        move_to place
        RandomEvent.sample(place, place.city, 'while wandering')
      end
    end
  end
end

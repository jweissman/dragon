module Dragon
  module Events
    class PlayerRemovedAccessoryEvent < Event
      attr_reader :player, :accessory

      def initialize(player: nil, accessory: nil)
        @player = player
        @accessory = accessory
      end

      def describe
        "#{player.name} removed the #{accessory.describe}"
      end
    end
  end
end

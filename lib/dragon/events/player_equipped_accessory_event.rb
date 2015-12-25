module Dragon
  module Events
    class PlayerEquippedAccessoryEvent < Event
      attr_reader :player, :accessory

      def initialize(player: nil, accessory: nil)
        @player = player
        @accessory = accessory
      end

      def describe
        "#{player.name} wore the #{accessory.describe} (defense rating is now #{player.defense_rating})"
      end
    end
  end
  
end

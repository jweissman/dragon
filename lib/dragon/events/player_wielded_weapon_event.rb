module Dragon
  module Events
    class PlayerWieldedWeaponEvent < Event
      attr_reader :player, :weapon
      def initialize(player: nil, weapon: nil)
        @player = player
        @weapon = weapon
      end

      def describe
        "#{player.name} wielded #{weapon.label} (attack rating is now #{player.attack_rating})"
      end
    end
  end
end

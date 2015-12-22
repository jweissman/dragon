module Dragon
  module Commands
    class WieldWeaponCommand < Command
      include Items

      attr_reader :player, :weapon
      def initialize(player: nil, weapon: nil)
        @player = player
        @weapon = weapon
      end

      def label
        if weapon.is_a?(NaturalWeapon)
          "Stop wielding a weapon"
        else
          pc = player.clone
          pc.wield!(weapon)
          "Wield #{weapon.describe} (#{pc.attack_rating})"
        end
      end

      def describe
        "You equip the #{weapon.describe}"
      end
    end
  end
end

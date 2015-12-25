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
        pc = player.clone
        pc.wield!(weapon)

        if weapon.is_a?(NaturalWeapon)
          "Stop wielding a weapon (#{pc.attack_rating})"
        else
          "Wield #{weapon.describe} (#{pc.attack_rating})"
        end
      end

      def describe
        "You wield #{weapon.describe}"
      end
    end
  end
end

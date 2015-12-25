module Dragon
  module Commands
    class RemoveAccessoryCommand < Command
      attr_reader :player, :accessory
      def initialize(player: nil, accessory: nil)
        @player    = player
        @accessory = accessory
      end

      def describe
        "You remove the #{accessory.describe}"
      end

      def label
        # why doesn't clone work here??
        pc = Marshal.load(Marshal.dump(player))
        pc.take_off!(pc.accessories.values.flatten.detect { |a| a.describe == accessory.describe })

        "Take off #{accessory.describe} (#{pc.defense_rating})"
      end
    end
  end
end

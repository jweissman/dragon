module Dragon
  module Commands
    class EquipAccessoryCommand < Command
      attr_reader :player, :accessory

      def initialize(player: nil, accessory: nil)
        @player = player
        @accessory = accessory
      end

      def describe
        "You put on #{accessory.describe}"
      end

      def label
        # why doesn't clone work here??
        pc = Marshal.load(Marshal.dump(player))
        pc.equip!(accessory)

        "Equip #{accessory.describe} (#{pc.defense_rating})"
      rescue => ex
        binding.pry
      end
    end
  end
end

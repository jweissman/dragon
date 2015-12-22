module Dragon
  module Commands
    class ReflectCommand < Command
      attr_reader :player

      def initialize(player: nil)
        @player = player
      end

      def describe
        "You reflect on your progress in the Realms"
      end

      def label
        "Look in a mirror"
      end
    end
  end
end

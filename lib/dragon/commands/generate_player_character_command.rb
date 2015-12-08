module Dragon
  module Commands
    class GeneratePlayerCharacterCommand < Command
      attr_reader :label

      def initialize(label: "Make up a hero for me")
        @label = label
      end

      def describe
        "You shall tell a tale of a random adventurer"
      end
    end
  end
end

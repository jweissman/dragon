module Dragon
  module Commands
    class NewPlayerCharacterCommand < Command
      attr_reader :label

      def initialize(label: 'Make my own hero')
        @label = label
      end

      def describe
        "You shall tell a new tale"
      end
    end
  end
end

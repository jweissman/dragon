module Dragon
  module Commands
    class ConverseCommand < Command
      attr_reader :person

      def initialize(person: nil)
        @person = person
      end

      def describe
        "You greet #{person.name}"
      end

      def label
        "Speak with #{person.label}"
      end
    end
  end
end

module Dragon
  module Commands
    class IgnorePersonCommand < Command
      attr_reader :person

      def initialize(person: nil)
        @person = person
      end

      def describe
        "You ignore #{@person.name} and keep exploring"
      end

      def label
        "Ignore #{@person.name}"
      end
    end
  end
end

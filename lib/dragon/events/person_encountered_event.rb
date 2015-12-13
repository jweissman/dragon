module Dragon
  module Events
    class PersonEncounteredEvent < Event
      attr_reader :person

      def initialize(person: nil)
        @person = person
      end

      def describe
        "You encounter a person: #{person.describe}"
      end

      def actions
        [ converse_with(person), ignore(person) ]
      end
    end
  end
end

module Dragon
  module Events
    class PersonEncounteredEvent < Event
      attr_reader :person, :place

      def initialize(person: nil, place: nil)
        @person = person
      end

      def describe
        "You encounter a person: #{person.describe}"
      end

      def actions
        [
          Dragon::Commands::ConverseCommand.new(person: person),
          Dragon::Commands::IgnorePersonCommand.new(person: person)
        ]
      end
    end
  end
end

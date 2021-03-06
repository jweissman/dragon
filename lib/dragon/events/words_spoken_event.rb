module Dragon
  module Events
    class WordsSpokenEvent < Event
      attr_reader :person, :message

      def initialize(person: nil, message: nil)
        @person = person
        @message = message
      end

      def describe
        "#{person.name} says \"#{message}\""
      end
    end
  end
end

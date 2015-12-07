module Dragon
  module Questions
    class AskAboutLife < Question
      attr_reader :person

      def initialize(person: nil)
        @person = person
        super(topic: person)
      end

      def describe
        "about life in general"
      end

      def responses
        [ "It's great!" ]
      end
    end
  end
end

module Dragon
  module Questions
    class AskAboutWork < Question
      attr_reader :profession
      def initialize(profession: nil)
        @profession = profession
        super(topic: profession)
      end

      def describe
        "about being a #{profession.type}"
      end

      def responses
        [
          "I really enjoy being a #{profession.type}"
        ]
      end

    end
  end
end

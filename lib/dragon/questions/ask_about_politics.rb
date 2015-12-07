module Dragon
  module Questions
    class AskAboutPolitics < Question
      def initialize
        super(topic: nil)
      end

      def describe
        "about politics"
      end

      def responses
        [ 
          "A dangerous line of questioning!",
          "How dare you!",
          "Off with his head! --Well, actually, I suppose it's fine..."
        ]
      end
    end
  end
end

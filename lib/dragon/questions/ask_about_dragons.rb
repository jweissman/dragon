module Dragon
  module Questions
    class AskAboutDragons < Question
      def describe
        "about Dragons"
      end

      def responses
        [
          "They are fell and mysterious beasts indeed!",
          "Have you tried searching in the mountains?"
        ]
      end
    end
  end
end

module Dragon
  module Questions
    class AskForQuests < Question
      def initialize
        # need a subject that is_a Quest, so...
        super(topic: Quest.new)
      end

      def describe
        "about quests"
      end

      def responses
        [ 
          "Yes, I might have some work for you!", 
          "Let me think if I need any help with anything..." 
        ]
      end
    end
  end
end

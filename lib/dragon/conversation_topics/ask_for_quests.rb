module Dragon
  class AskForQuests < ConversationTopic
    def about_missions?
      true
    end

    def describe
      "about quests"
    end

    def responses
      [ "Yes, I might have some work!", "Let me think if I need any help!" ]
    end
  end
end

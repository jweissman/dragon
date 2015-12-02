module Dragon
  class AskToStopPlayingMusic < ConversationTopic
    def about_activity?
      true
    end

    def activity
      [ :sitting, :resting ].sample
    end

    def describe
      "to stop playing music"
    end

    def responses
      [ "Fine, I'll stop playing" ]
    end
  end
end

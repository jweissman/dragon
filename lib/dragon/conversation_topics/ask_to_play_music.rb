module Dragon
  class AskToPlayMusic < ConversationTopic
    def about_activity?
      true
    end

    def activity
      :playing_music
    end

    def describe
      "to play some music"
    end

    def responses
      [ "Absolutely! I'll play something." ]
    end
  end
end

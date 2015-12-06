module Dragon
  class ConversationAboutPolitics < ConversationTopic
    def describe
      "about the politics of the Kingdom"
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

module Dragon
  class ConversationAboutLife < ConversationTopic
    def describe
      "about life in general"
    end

    def responses
      [ 
        "Oh, you know. Alright.",
        "Pretty great!",
        "It's going good. And how art thou?"
      ]
    end
  end
end

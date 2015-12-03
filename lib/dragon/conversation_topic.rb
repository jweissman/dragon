module Dragon
  class ConversationTopic
    def describe
      'override ConversationTopic#describe in subclass'
    end

    def about_activity?
      false
    end
  end
end

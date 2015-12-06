module Dragon
  class ConversationAboutWork < ConversationTopic
    attr_reader :profession

    def initialize(profession: nil)
      @profession = profession
    end

    def describe
      "about being a #{profession.type}"
    end
    
    def responses
      [
        "I really enjoy being a #{profession.type}",
        "It's okay, it's a living",
        "Can't complain!",
        "Difficult but good"
      ]
    end
  end
end

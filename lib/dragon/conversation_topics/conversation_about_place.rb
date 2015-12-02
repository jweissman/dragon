module Dragon
  class ConversationAboutPlace < ConversationTopic
    attr_reader :place

    def initialize(place: nil)
      @place = place
    end

    def describe
      "about #{place.describe}"
    end

    def responses
      [
        "I love it!",
        "#{place.describe} is awesome",
        "The town fathers built it!"
      ]
    end
  end
end


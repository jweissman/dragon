module Dragon
  class Question
    attr_reader :topic

    def initialize(topic: nil)
      @topic = topic
    end

    def about?(subject)
      topic.is_a?(subject)
    end
  end
end

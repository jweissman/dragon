module Dragon
  class ConversationTopic
    attr_reader :partner, :conversation

    def initialize(partner: nil, conversation: nil)
      @partner = partner
      @conversation = conversation
    end

    def show_gold?
      false
    end

    def show_items?
      false
    end
  end
end

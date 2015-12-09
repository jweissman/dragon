module Dragon
  class ConversationTopic
    attr_reader :partner, :conversation

    def initialize(partner: nil, conversation: nil)
      @partner = partner
      @conversation = conversation
    end
  end
end

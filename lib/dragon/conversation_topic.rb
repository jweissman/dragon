module Dragon
  class ConversationTopic
    attr_reader :partner, :conversation

    include ::Dragon::Commands
    include Questions
    include ::Dragon::Helpers::CommandHelpers

    def initialize(partner: nil, conversation: nil)
      @partner = partner
      @conversation = conversation
    end

    def player
      conversation.player
    end

    def show_gold?
      false
    end

    def show_items?
      false
    end
  end
end

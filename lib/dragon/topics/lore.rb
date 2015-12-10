module Dragon
  module Topics
    class Lore < ConversationTopic
      def describe
        "discussing lore with #{partner.name}"
      end

      def actions(world)
        questions(world).map do |question|
          Dragon::Commands::AskQuestionCommand.new(question: question, partner: partner)
        end
      end

      def questions(world)
        [
          Dragon::Questions::AskAboutWorld.new(world: world),
          Dragon::Questions::AskAboutDragons.new
        ]
      end
    end
  end
end

module Dragon
  module Topics
    class Lore < ConversationTopic
      def label
        "discussing lore"
      end

      def describe
        "discussing lore with #{partner.name}"
      end

      def actions(world)
        questions(world).map do |question|
          ask_question(question, partner)
        end
      end

      def questions(world)
        [
          AskAboutWorld.new(world: world),
          AskAboutDragons.new
        ]
      end
    end
  end
end

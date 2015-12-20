module Dragon
  module Topics
    class NullTopic < ConversationTopic
      def describe
        "talking casually with #{partner.name}"
      end

      def label
        "talking casually"
      end

      def actions(*)
        []
      end
    end
  end
end

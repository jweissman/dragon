module Dragon
  module Topics
    class NullTopic < ConversationTopic
      def describe
        "talking with #{partner.name}"
      end

      def actions(*)
        []
      end
    end
  end
end

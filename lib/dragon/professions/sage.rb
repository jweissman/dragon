module Dragon
  module Professions
    class Sage < Profession
      def conversation_topics
        [ Topics::Lore ]
      end
    end
  end
end

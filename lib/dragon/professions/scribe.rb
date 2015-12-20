module Dragon
  module Professions
    class Scribe < Profession
      tagged :books, :lore, :writing, :drafting

      def conversation_topics
        [ Topics::Lore ]
      end
    end
  end
end

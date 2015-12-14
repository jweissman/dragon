module Dragon
  module Professions
    class Sage < Profession
      tagged :learning, :lore
      
      def conversation_topics
        [ Topics::Lore ]
      end
    end
  end
end

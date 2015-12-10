module Dragon
  module Professions
    class Gambler < Profession
      def conversation_topics
        [ Topics::Gambling ]
      end
    end
  end
end

module Dragon
  module Professions
    class Gambler < Profession
      def activities
        [ ThrowingDice ]
      end

      def conversation_topics
        [ Topics::Gambling ]
      end
    end
  end
end

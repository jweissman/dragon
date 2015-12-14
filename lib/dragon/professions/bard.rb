module Dragon
  module Professions
    class Bard < Profession
      tagged :music, :lore

      def activities
        [ PlayingMusic, Singing ]
      end

      def questions(person)
        qs = if person.activity.is_a?(PlayingMusic)
               [ AskToStop.new(activity: person.activity) ]
             else
               [ AskToStart.new(activity: PlayingMusic.new) ]
             end

        super + qs
      end

      def conversation_topics
        [ Topics::Lore ]
      end
    end
  end
end

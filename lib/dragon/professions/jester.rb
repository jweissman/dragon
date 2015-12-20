module Dragon
  module Professions
    class Jester < Profession
      tagged :comedy, :entertainment, :games, :fun, :jokes

      def activities
        [ Juggling ]
      end
    end
  end
end

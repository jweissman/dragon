module Dragon
  module Professions
    class Noble < Profession
      def self.unique?
        true
      end

      def questions(*)
        [ AskForQuests.new ]
      end
    end
  end
end

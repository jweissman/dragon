module Dragon
  module Professions
    class Noble < Profession
      tagged :royal

      def self.unique?
        true
      end

      def questions(*)
        [ AskForQuests.new ]
      end
    end
  end
end

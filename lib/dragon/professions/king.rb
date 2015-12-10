module Dragon
  module Professions
    class King < Noble
      def questions(*args)
        super(*args) + [ AskAboutPolitics.new ]
      end
    end
  end
end

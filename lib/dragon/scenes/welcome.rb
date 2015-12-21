module Dragon
  module Scenes
    class Welcome < Scene
      def describe(*)
        "entering the Realms"
      end

      def permit_delays?
        false
      end

      def default_narration
        "Thanks for playing Dragon! To start playing, you'll need to create a character."
      end

      def actions(*)
        [ new_pc, generate_pc ]
      end
    end
  end
end

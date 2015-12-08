module Dragon
  module Scenes
    class Welcome < Scene
      def describe
        "entering the Realms"
      end

      def permit_delays?
        false
      end

      def squelch_narration?
        true
      end

      def default_narration
        "Thanks for playing Dragon! To start playing, you'll need to create a character. Select whether you'd like to enter all the information for your character by hand or whether you'd like the engine to generate it for you. Once you've made your selection, press GO to start!<br/>"
      end

      def actions(*)
        if event_actions.any?
          event_actions
        else
          [
            # LearnAboutTheRealms.new
            NewPlayerCharacterCommand.new,
            GeneratePlayerCharacterCommand.new
          ]
        end
      end
    end
  end
end

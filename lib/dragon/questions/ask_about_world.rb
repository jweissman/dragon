module Dragon
  module Questions
    class AskAboutWorld < Question
      attr_reader :world
      def initialize(world: nil)
        @world = world

        super(topic: @world)
      end

      def describe
        "about the world of #{world.name}"
      end

      def responses
        [
          "#{world.name} was created #{seconds_since_genesis} seconds ago.",
          "There are many worlds like ours; there is a great cycle of creation and destruction."
        ]
      end

      def seconds_since_genesis
        Time.now - world.created_at
      end
    end
  end
end

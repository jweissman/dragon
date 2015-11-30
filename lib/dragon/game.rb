module Dragon
  class Game
    extend Forwardable
    def_delegators :console, :say, :ask, :choose, :banner, 
                             :welcome, :narrate

    def_delegators :engine, :step, :still_playing?

    def boot!
      banner and play
      say 'Thanks for playing!'
    end

    def play
      welcome player
      step while still_playing?
    end

    private
    def engine
      @engine ||= Dragon::Engine.new(
        player: player,
        console: console,
        world: world
      )
    end

    def player
      @player ||= PlayerCharacter.build(console)
    end

    def console
      @console ||= GameTerminal.new
    end

    def world
      @world ||= World.generate
    end
  end
end

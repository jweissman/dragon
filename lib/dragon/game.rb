module Dragon
  class Game
    extend Forwardable
    def_delegators :terminal, :say, :banner, :welcome, :narrate

    def_delegators :engine, :step, :still_playing?

    def boot!
      banner and play
      say 'Thanks for playing!'
    end

    def play
      step while still_playing?
    end

    private
    def engine
      @engine ||= Dragon::Engine.new(
        terminal: terminal,
        world: world
      )
    end

    def terminal
      @terminal ||= GameTerminal.new(console)
    end

    def console
      @console ||= Console.new
    end

    def world
      @world ||= World.new
    end
  end
end

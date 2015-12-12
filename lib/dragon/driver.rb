module Dragon
  class Driver
    extend Forwardable
    def_delegators :terminal, :say, :banner, :welcome

    attr_reader :world

    def initialize(world)
      @world = world
    end

    def describe
      game_narrator.narrate(engine.last_command, engine.last_events,
        deep: game.scene.deep_narration?)
    end

    def terminal
      @terminal ||= GameTerminal.new(console)
    end

    def console
      @console ||= Console.new
    end

    def game
      @game ||= Game.new(world: world)
    end

    def game_narrator
      @game_narrator ||= GameNarrator.new(game, terminal: terminal)
    end

    def engine
      @engine ||= Engine.new(
        terminal: terminal,
        game: game
      )
    end
  end
end

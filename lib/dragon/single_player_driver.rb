module Dragon
  def self.single_player
    @single_player_driver ||= SinglePlayerDriver.new(World.new)
  end

  class SinglePlayerDriver < Driver
    def boot!
      banner
      play
    end

    def play
      step while game.still_playing?
      say 'Thanks for playing!'
    end

    def step
      describe
      interact
    end

    def interact
      engine.prompt_player
      engine.react(engine.player.action)
    end
  end
end

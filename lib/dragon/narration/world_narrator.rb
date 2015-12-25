module Dragon
  class WorldNarrator < Narrator
    alias_method :world, :model

    def narrate(terminal)
      describe prefix: "You are in the world of ", terminal: terminal
    end
  end
end

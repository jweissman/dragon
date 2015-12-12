module Dragon
  class WorldNarrator < Narrator
    alias_method :world, :model

    def narrate
      describe prefix: "You are in the world of "
    end
  end
end

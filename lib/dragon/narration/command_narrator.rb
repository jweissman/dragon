module Dragon
  class CommandNarrator < Narrator
    alias_method :command, :model

    def narrate
      describe important: true
    end
  end
end

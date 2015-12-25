module Dragon
  class CommandNarrator < Narrator
    alias_method :command, :model

    def narrate(terminal)
      describe important: true, terminal: terminal
    end
  end
end

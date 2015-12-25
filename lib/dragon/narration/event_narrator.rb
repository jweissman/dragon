module Dragon
  class EventNarrator < Narrator
    alias_method :event, :model

    def narrate(terminal)
      describe important: true, terminal: terminal
    end
  end
end

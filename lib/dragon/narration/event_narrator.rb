module Dragon
  class EventNarrator < Narrator
    alias_method :event, :model

    def narrate
      describe important: true
    end
  end
end

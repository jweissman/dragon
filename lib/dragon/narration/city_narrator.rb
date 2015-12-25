module Dragon
  class CityNarrator < Narrator
    def narrate(terminal)
      describe prefix: "You are visiting ", terminal: terminal
    end
  end
end

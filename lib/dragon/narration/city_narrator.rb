module Dragon
  class CityNarrator < Narrator
    def narrate
      describe prefix: "You are visiting "
    end
  end
end

module Dragon
  class PlaceNarrator < Narrator
    alias_method :place, :model

    def narrate(terminal)
      if place.is_a?(Room)
        describe prefix: prefix, suffix: " of a #{place.building.describe}", terminal: terminal
      else
        describe prefix: prefix, terminal: terminal
      end

      if place.people.any?
        descriptor = describe_number_of_people(place.people.count)
        terminal.say "There #{descriptor} here: #{describe_people(place.people)}."
      end
    end

    def prefix
      "You are #{place_preposition} the "
    end

    def place_preposition
      if place.is_a?(Room)
        'in'
      elsif place.is_a?(Area)
        'wandering near'
      elsif place.is_a?(Building)
        'at'
      end
    end

    def describe_people(people)
      people.map(&:describe).join('; ')
    end

    def describe_number_of_people(number)
      case number
      when 0 then
        'is nobody'
      when 1 then
        'is one person'
      when 2 then
        'are two people'
      when (3..4) then
        'are a few people'
      when (5..6) then
        'are a bunch of people'
      else
        'is a crowd of people'
      end
    end
  end
end

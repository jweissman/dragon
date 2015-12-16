module Dragon
  class RandomEvent
    extend Random
    include Events

    def self.sample(destination, origin, cause=nil)
      sample_percentages({
        30 => -> { ItemFoundEvent.new(item: Item.generate) },
        15 => -> { PersonEncounteredEvent.new(person: Person.generate) },
        60 => -> { EnemyEncounteredEvent.new(enemy: Enemy.generate(destination)) },
        5  => -> { place_discovered(destination, origin, cause) }
      }).call
    end

    def self.place_discovered(destination, origin, cause)
      city = if destination.is_a?(Area)
        destination.city
      elsif destination.is_a?(City)
        destination
      end

      place = Area.generate(city)

      PlaceDiscoveredEvent.new(
        place: place,
        original_destination: destination,
        origin: origin,
        cause: cause
      )
    end
  end
end

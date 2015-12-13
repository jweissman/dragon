module Dragon
  class RandomEvent
    extend Random
    include Events

    def self.sample(destination, origin, cause=nil)
      sample_percentages({
        30 => -> { ItemFoundEvent.new(item: Item.generate) },
        15 => -> { PersonEncounteredEvent.new(person: Person.generate) },
        60 => -> { EnemyEncounteredEvent.new(enemy: Enemy.generate) },
        5  => -> { place_discovered(destination, origin, cause) }
      }).call
    end

    def self.place_discovered(destination, origin, cause)
      place = if destination.is_a?(Area)
        Area.generate(destination.city, Area.types_for_discovery.sample)
      elsif destination.is_a?(City)
        Area.generate(destination, Area.types_for_discovery.sample)
      end

      PlaceDiscoveredEvent.new(
        place: place,
        original_destination: destination,
        origin: origin,
        cause: cause
      )
    end
  end
end

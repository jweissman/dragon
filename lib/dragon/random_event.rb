module Dragon
  class RandomEvent
    include Dragon::Events

    def self.sample(destination, origin)
      [
        ItemFoundEvent.new(item: Item.generate),

        PersonEncounteredEvent.new(person: Person.generate),

        EnemyEncounteredEvent.new(enemy: Enemy.generate),
        EnemyEncounteredEvent.new(enemy: Enemy.generate),
        EnemyEncounteredEvent.new(enemy: Enemy.generate),

        place_discovered(destination, origin)
      ].sample
    end

    def self.place_discovered(destination, origin)
      place = if destination.is_a?(Area)
        Area.generate(destination.city, Area.types_for_discovery.sample)
      elsif destination.is_a?(City)
        Area.generate(destination, Area.types_for_discovery.sample)
      end

      PlaceDiscoveredEvent.new(
        place: place,
        original_destination: destination,
        origin: origin
      )
    end
  end
end

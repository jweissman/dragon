module Dragon
  class RandomEvent
    extend Random
    include Events
    include Items

    def self.sample(destination, origin, cause=nil)
      sample_percentages({
        12 => -> { ItemFoundEvent.new(item: Item.generate(exclude_types: [NaturalWeapon, NaturalArmor])) },
        38 => -> { PersonEncounteredEvent.new(person: Person.generate) },
        90 => -> { EnemyEncounteredEvent.new(enemy: Enemy.generate(destination)) },
        3  => -> { place_discovered(destination, origin, cause) }
      }).call
    end

    def self.place_discovered(destination, origin, cause)
      city = if destination.is_a?(Area)
        destination.city
      elsif destination.is_a?(City)
        destination
      end

      place = Area.generate(city, insert: true)

      PlaceDiscoveredEvent.new(
        place: place,
        original_destination: destination,
        origin: origin,
        cause: cause
      )
    end
  end
end

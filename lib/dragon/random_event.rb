module Dragon
  class RandomEvent
    extend Random
    include Events
    include Items

    def self.sample(destination, origin, cause=nil)
      EnemyEncounteredEvent.new(enemy: Enemy.generate(destination)) 
      # sample_percentages({
      #   2  => -> { place_discovered(destination, origin, cause) },
      #   6  => -> { ItemFoundEvent.new(item: Equipment.generate(exclude_types: [NaturalWeapon, NaturalArmor])) },
      #   12 => -> { ItemFoundEvent.new(item: Treasure.generate) },
      #   20 => -> { PersonEncounteredEvent.new(person: Person.generate) },
      #   60 => -> { EnemyEncounteredEvent.new(enemy: Enemy.generate(destination)) },
      # }).call
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

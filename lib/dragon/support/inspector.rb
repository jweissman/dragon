module Dragon
  module Support
    class Inspector
      def tags
        print Dragon::Entity.all_tags.join(', ') + "\n"
      end

      def cities
        CitySubtype.types.each do |city_type|
          buildings = city_type.associated(Building).map(&:new).map(&:type).join(', ')
          puts "#{city_type.new.type.rjust(20)} => #{buildings}"
        end
      end

      def buildings
        Building.types.each do |building_type|
          rooms = building_type.associated(Room).map(&:new).map(&:type).join(', ')
          puts "#{building_type.new.type.rjust(20)} => #{rooms}"
        end
      end

      def creatures
        Creature.types(exclude_types: [Person]).
        sort_by { |type| challenge_rating_for(type) }.
        group_by { |type| (challenge_rating_for(type)/5).floor }.
        each do |challenge_level, types|
          puts "====> challenge level #{challenge_level}"
          types.each do |type|
            creature = type.new
            puts "#{creature.label} (#{challenge_rating_for(type)}) [#{creature.xp} xp] [#{creature.bounty} gold] <#{creature.attack_rating}/#{creature.defense_rating}>"
          end
        end
      end

      def challenge_rating_for(type)
        @challenge_ratings ||= {}
        @challenge_ratings[type] ||= self.compute_cr_for(type)
      end

      def compute_cr_for(type)
        creatures = Array.new(5) { type.new }
        creatures.map(&:challenge_rating).reduce(&:+) / creatures.size.to_f
      end
    end
  end

end

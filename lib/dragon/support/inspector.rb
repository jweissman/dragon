module Dragon
  module Support
    class Inspector
      def introspect
        puts
        puts "(introspecting over the Dragon engine as currently configured, please wait)"
        puts
        puts
        puts "----> Player Classes"
        puts
        player_classes
        puts
        puts
        puts "----> Creatures (challenge rating)"
        puts
        creatures
        puts
        puts
        puts "----> GATHERING ALL TAGS..."
        puts
        tags
        puts
        puts "----> CITIES : BUILDINGS"
        puts
        cities
        puts
        puts "----> BUILDINGS : ROOMS"
        puts
        buildings
        puts
        puts
      end

      def tags
        print Dragon::Entity.all_tags.join(', ') + "\n"
      end

      def player_classes
        Profession.adventuring.each do |profession|
          pc = PlayerCharacter.new('fake', profession)
          puts "  #{profession}"
          puts "       stats: #{pc.stats}"
          puts "     atk/def: #{pc.attack_rating}/#{pc.defense_rating}"
        end
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
          group_by { |type| (challenge_rating_for(type)) }.
          each do |challenge_level, types|
          puts "====> challenge level #{challenge_level}"
          types.each do |type|
            creature = type.new
            puts "#{creature.type.rjust(15,' ')} (#{challenge_rating_for(type)}) [#{creature.xp} xp] [#{creature.bounty} gold] <#{creature.attack_rating} atk/#{creature.defense_rating} def> -- #{creature.stats}"
          end
          end
      end

      def challenge_rating_for(type)
        @challenge_ratings ||= {}
        @challenge_ratings[type] ||= self.compute_cr_for(type)
      end

      def compute_cr_for(type)
        creatures = Array.new(10) { type.new }
        creatures.map(&:challenge_rating).reduce(&:+) / creatures.size.to_f
      end
    end
  end

end

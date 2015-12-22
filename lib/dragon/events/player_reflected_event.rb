module Dragon
  module Events
    class PlayerReflectedEvent < Event
      include Items

      attr_reader :player

      def initialize(player: nil)
        @player = player
      end

      def actions
        equip_weapon_actions + wear_armor_actions + [ContinueAdventureCommand.new]
      end

      def wear_armor_actions
        armors = player.inventory.select { |item| item.is_a?(Armor) }
        (armors + [player.default_armor]).map do |armor|
          WearArmorCommand.new(player: player, armor: armor) if player.armor != armor
        end
      end

      def equip_weapon_actions
        weapons = player.inventory.select { |item| item.is_a?(Weapon) }
        (weapons + [player.default_weapon]).map do |weapon|
          WieldWeaponCommand.new(player: player, weapon: weapon) if player.weapon != weapon
        end
      end

      def describe
        description = "You are #{player.name}, a #{player.subtype} #{player.race} #{player.profession.type}."
        description += " You are wielding #{player.weapon.describe} (your attack rating is #{player.attack_rating})."
        description += " You are wearing #{player.armor.describe} (your defense rating is #{player.defense_rating})."
        player.stats.each do |name, value|
          description += " Your #{name} is #{describe_stat(value)} (#{value})."
        end
        description += " You have #{player.gold} gold pieces." if player.gold > 0 #.any?
        description += " Your inventory includes: #{player.inventory.map(&:describe).join(', ')}." if player.inventory.any?
        description += " Your quests include #{player.quests.map(&:describe).join(', ')}."  if player.quests.any?
        description
      end

      def describe_stat(value)
        case value
        when 0..1 then 'terrible'
        when 1..2 then 'awful'
        when 2..4 then 'very poor'
        when 4..6 then 'poor'
        when 6..8 then 'fair'
        when 8..10 then 'average'
        when 10..12 then 'good'
        when 12..14 then 'very good'
        when 14..16 then 'excellent'
        when 16..18 then 'superb'
        when 18..19 then 'epic'
        else
          'indescribable'
        end
      end
    end
  end
end

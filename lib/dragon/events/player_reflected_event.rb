module Dragon
  module Events
    class PlayerReflectedEvent < Event
      include Items
      attr_reader :player

      def initialize(player: nil)
        @player = player
      end

      def actions
        equip_weapon_actions +
          wear_armor_actions +
          equip_accessory_actions +
          professional_actions +
          base_actions
      end

      def base_actions
        [ continue_game, exit_game ]
      end

      def professional_actions
        if player.xp > player.xp_for_upgrade
          [ level_up(player) ]
        else
          []
        end
      end

      def wear_armor_actions
        armors = player.inventory.select { |item| item.is_a?(Armor) }
        (armors + [player.unarmed_armor]).map do |armor|
          wear_armor(player, armor) if player.armor != armor
        end
      end

      def equip_weapon_actions
        weapons = player.inventory.select { |item| item.is_a?(Weapon) }
        (weapons + [player.unarmed_weapon]).map do |weapon|
          wield_weapon(player, weapon) if player.weapon != weapon
        end
      end

      def equip_accessory_actions
        accessories = player.inventory.select { |item| item.is_a?(Accessory) }
        equip_actions = accessories.map do |accessory|
          equip_accessory(player, accessory) if player.can_equip?(accessory)
        end

        remove_actions = player.accessories.flat_map do |_, set|
          set.map do |accessory|
            remove_accessory(player, accessory)
          end
        end

        equip_actions + remove_actions
      end

      def describe
        description = "You are #{player.describe}"

        description += " You have #{player.xp} experience points (you need #{player.xp_for_upgrade} XP to advance to level #{player.level+1})."

        description += " You are wielding #{player.weapon.describe(prefix: 'a')} (your attack rating is #{player.attack_rating})."
        description += " You are wearing #{describe_gear} (your defense rating is #{player.defense_rating})."

        player.stats.each do |name, value|
          description += " Your #{name} is #{describe_stat(value)} (#{value})."
        end

        description += " You have #{player.gold} gold pieces." if player.gold > 0
        description += " Your inventory includes: #{player.inventory.map(&:describe).join(', ')}." if player.inventory.any?
        description += " Your quests include #{player.quests.map(&:describe).join(', ')}."  if player.quests.any?
        description
      end

      def describe_gear
        ([player.armor] + player.accessories.values.flatten).map(&:describe).join(', ')
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

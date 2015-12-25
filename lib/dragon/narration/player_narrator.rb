module Dragon
  class PlayerNarrator < Narrator
    alias_method :player, :model

    def narrate(terminal, display_gold: false, display_quests: false, display_items: false)
      if display_items && player.inventory.any?
        inventory_description = player.inventory.map(&:describe).join(', ')
        terminal.say "You have #{player.gold} gold pieces, and your inventory includes: #{inventory_description}"
      elsif display_gold && player.gold > 0
        terminal.say "You have #{player.gold} gold pieces."
      end

      if display_quests && player.quests.any?
        quest_description = player.quests.map(&:describe).join(', ')
        terminal.say "Your quests include #{quest_description}"
      end
    end
  end
end

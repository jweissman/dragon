module Dragon
  module Helpers
    module CommandHelpers
      include Dragon::Commands

      def new_pc(*args)
        NewPlayerCharacterCommand.new(*args)
      end

      def generate_pc(*args)
        GeneratePlayerCharacterCommand.new(*args)
      end

      def create_pc(player)
        CreatePlayerCharacterCommand.new(
          name: player.name,
          age: player.age,
          gender: player.gender,
          race: player.race,
          subtype: player.subtype,
          profession: player.profession
        )
      end

      def purchase_item(item, merchant)
        PurchaseItemCommand.new(
          item: item,
          cost: item.cost * 2,
          merchant: merchant
        )
      end

      def take_item(item)
        TakeItemCommand.new(item: item)
      end

      def leave_item(item)
        LeaveItemCommand.new(item: item)
      end

      def engage(enemy)
        EngageCombatantCommand.new(enemy: enemy)
      end

      def attack(enemy, player)
        AttackCommand.new(enemy: enemy, player: player)
      end

      def flee(enemy)
        FleeCommand.new(enemy: enemy)
      end

      def wander_around(place, label=nil)
        WanderCommand.new(place: place, label: label)
      end

      def stay_here(place)
        StayHereCommand.new(place: current_place)
      end

      def converse_with(person)
        ConverseCommand.new(person: person)
      end

      def ignore(person)
        IgnorePersonCommand.new(person: person)
      end

      def ask_question(question, partner)
        AskQuestionCommand.new(question: question, partner: partner)
      end

      def redeem_quest(quest)
        RedeemQuestCommand.new(quest: quest)
      end

      def tell_joke(partner)
        TellJokeCommand.new(subject: Profession.all.sample.new, partner: partner)
      end

      def wager(outcome, outcomes, amount, partner)
        PlaceWagerCommand.new(
          outcome:     outcome,
          outcome_set: outcomes,
          amount:      wager_amount,
          partner:     partner
        )
      end

      def accept_quest(quest)
        AcceptQuestCommand.new(quest: quest)
      end

      def reject_quest(quest)
        RejectQuestCommand.new(quest: quest)
      end

      def change_subject(partner, conversation, topic_class)
        new_subject = topic_class.new(conversation: conversation, partner: partner)
        ChangeConversationSubjectCommand.new(
          partner: partner,
          new_subject: new_subject,
          conversation: conversation
        )
      end

      def say_goodbye(partner)
        SayGoodbyeCommand.new(partner: partner)
      end

      def visit(place)
        VisitCommand.new(place: place)
      end

      def egress_from(place)
        EgressCommand.new(place: place)
      end

      def travel(place, label=nil)
        TravelCommand.new(destination: place, label: label)
      end

      def reflect(player)
        ReflectCommand.new(player: player)
      end

      def wield_weapon(player, weapon)
        WieldWeaponCommand.new(player: player, weapon: weapon)
      end

      def wear_armor(player, armor)
        WearArmorCommand.new(player: player, armor: armor)
      end

      def equip_accessory(player, accessory)
        EquipAccessoryCommand.new(player: player, accessory: accessory)
      end

      def remove_accessory(player, accessory)
        RemoveAccessoryCommand.new(player: player, accessory: accessory)
      end

      def level_up(player)
        LevelUpCommand.new(player: player)
      end

      def upgrade_statistic(player, stat_name)
        UpgradeStatisticCommand.new(player: player, stat_name: stat_name)
      end

      def continue_game
        ContinueAdventureCommand.new
      end

      def exit_game
        ExitGameCommand.new
      end
    end
  end
end

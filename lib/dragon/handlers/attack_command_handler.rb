module Dragon
  module Handlers
    class AttackCommandHandler < CommandHandler
      def handle(command)
        enemy = command.enemy
        player = command.player
        assemble_events(enemy, player)
      end

      def assemble_events(enemy, player)
        events = []
        events << player_attacks_enemy(enemy, player)

        if enemy.alive?
          events << EnemyAttackedEvent.new(enemy: enemy)
          events << enemy_attacks_player(enemy, player)
        end

        events
      end

      def player_attacks_enemy(enemy, player)
        result = perform_attack(player, enemy)

        if result.hit?
          EnemyTookDamageEvent.new(enemy: enemy, amount: result.amount)
        elsif result.dodge?
          EnemyDodgedAttackEvent.new(enemy: enemy)
        elsif result.ko?
          transition_to exploration

          player.xp += enemy.xp
          player.gold += enemy.bounty

          events = [
            EnemyDiedEvent.new(enemy: enemy, xp: enemy.xp, gold: enemy.bounty)
          ]

          if engine.last_destination
            events.push(RandomEncounterResolvedEvent.new(destination: engine.last_destination, current_place: engine.place))
          end

          events
        end
      end

      def enemy_attacks_player(enemy, player)
        result = perform_attack(enemy, player)

        if result.hit?
          PlayerTookDamageEvent.new(enemy: enemy, amount: result.amount)
        elsif result.dodge?
          PlayerDodgedAttackEvent.new(enemy: enemy)
        elsif result.ko?
          hospital = take_player_to_hospital(player)

          PlayerPassedOutEvent.new(
            player: player, 
            place: hospital, 
            cause: "#{enemy.describe} defeated you"
          )
        end
      end

      def take_player_to_hospital(player)
        hospital = world.random_hospital

        move_to(hospital.rooms.sample)
        player.heal!
        transition_to(exploration)


        hospital
      end

      protected
      def perform_attack(a, b)
        attack_succeeded = rand < a.chance_of_hitting(b)
        if attack_succeeded
          damage = a.attack!(b)
          if b.alive?
            Damage.new(amount: damage)
          else
            Knockout.new
          end
        else
          Dodge.new
        end
      end
    end
  end
end

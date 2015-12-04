module Dragon
  module Handlers
    class AttackCommandHandler < CommandHandler
      def handle(command)
        enemy = command.enemy
        player = command.player

        facts = []
        facts << player_attacks_enemy(enemy, player)

        if enemy.alive?
          facts << EnemyAttackedEvent.new(enemy: enemy)
          facts << enemy_attacks_player(enemy, player)
        end

        facts
      end

      def player_attacks_enemy(enemy, player)
        attack_succeeded = rand > player.chance_of_hitting(enemy)
        if attack_succeeded
          damage = player.attack!(enemy)
          if enemy.alive?
            EnemyTookDamageEvent.new(enemy: enemy, amount: damage)
          else
            engine.transition_to(engine.initial_scene)
            EnemyDiedEvent.new(enemy: enemy, xp: enemy.xp)
          end
        else
          EnemyDodgedAttackEvent.new(enemy: enemy)
        end
      end

      def enemy_attacks_player(enemy, player)
        attack_succeeded = rand > enemy.chance_of_hitting(player)
        if attack_succeeded
          damage = enemy.attack!(player)
          if player.alive?
            PlayerTookDamageEvent.new(enemy: enemy, amount: damage)
          else
            player.heal!

            hospital = engine.world.random_hospital

            engine.move_to(hospital.rooms.sample)
            engine.transition_to(engine.initial_scene)

            #player_passed_out(player, hospital, enemy)
            PlayerPassedOutEvent.new(
              player: player, 
              place: hospital, 
              cause: "the #{enemy.describe} defeated you"
            )
          end
        else
          PlayerDodgedAttackEvent.new(enemy: enemy)
        end
      end
    end
  end
end

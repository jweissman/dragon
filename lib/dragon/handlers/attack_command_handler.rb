module Dragon
  module Handlers
    class AttackCommandHandler < CommandHandler
      def handle(command)
        enemy = command.enemy
        player = command.player

        attack_succeeded = rand > 0.5 

        if attack_succeeded
          damage = player.attack_damage_against(enemy)
          enemy.take_damage!(damage)

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
    end
  end
end

module Dragon
  module Scenes
    class Combat < Scene
      attr_reader :enemy

      def with(enemy: nil)
        @enemy = enemy
        self
      end

      def tick
        enemy_attack!
      end

      def describe
        "engaged in combat with #{enemy.describe}"
      end

      def actions(_)
        [
          AttackCommand.new(enemy: enemy, player: player),
          FleeCommand.new(enemy: enemy)
        ]
      end

      def enemy_attack!
        damage = enemy.attack_damage_against(player)
        # attack_succeeded = rand > 0.5
        player.take_damage!(damage)

        evt = if player.alive?
          Dragon::Events::PlayerTookDamageEvent.new(enemy: enemy, amount: damage)
        else
          # seems weird to do this *inside* a scene...
          # could trigger all this from player atk handler?
          player.hp = player.max_hp
          place = engine.world.random_hospital

          engine.move_to(place.rooms.sample)
          engine.transition_to(engine.initial_scene) 

          Dragon::Events::PlayerPassedOutEvent.new(player: player, place: place, cause: "a #{enemy.describe} defeated you")
        end

        engine.last_events.push(evt) #player_took_damage)
      end
    end
  end
end

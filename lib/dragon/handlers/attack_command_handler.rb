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
          engine.transition_to(engine.initial_scene)
          EnemyDiedEvent.new(enemy: enemy, xp: enemy.xp)
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
            cause: "the #{enemy.describe} defeated you"
          )
        end
      end

      def take_player_to_hospital(player)
        hospital = engine.world.random_hospital

        engine.move_to(hospital.rooms.sample)
        engine.transition_to(engine.initial_scene)

        player.heal!

        hospital
      end

      protected
      class AttackResult
        attr_reader :amount

        def dodge?; false end
        def ko?; false end
        def hit?; false end
      end

      class Dodge < AttackResult
        def dodge?; true end
      end

      class Knockout < AttackResult
        def ko?; true end
      end

      class Damage < AttackResult
        def initialize(amount: nil)
          @amount = amount
        end

        def hit?; true end
      end

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

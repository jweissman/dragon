require 'spec_helper'

describe AttackCommandHandler do
  subject(:attack_command_handler) do
    AttackCommandHandler.new(engine)
  end

  let(:engine) do
    instance_double Engine, game: game, last_destination: nil
  end

  let(:game) do
    instance_double Game, transition_to: true
  end

  let(:command) do
    instance_double('AttackCommand', enemy: enemy, player: player)
  end
  

  let(:enemy) do
    instance_double('Enemy', alive?: enemy_alive?, chance_of_hitting: 1.0, attack!: true, xp: 1_000_000, :'xp=' => nil, bounty: 1_000)
  end

  let(:player) do
    instance_double('Player', alive?: true, chance_of_hitting: 1.0, attack!: damage, xp: 1_000_000, :'xp=' => 0, gold: 1_000_000_000, :'gold=' => nil, :xp_for_upgrade => 1_000)
  end

  let(:enemy_alive?) { true }

  describe '#handle' do
    context 'with a lethal attack that hits' do
      let(:events) do
        subject.handle(command)
      end

      let(:damage) { 1_000 }
      let(:enemy_alive?) { false }

      let(:enemy_died) do
        events.detect do |event|
          event.is_a?(EnemyDiedEvent)
        end
      end

      it 'results in the enemy dying' do
        expect(events.first).to eq(enemy_died)
      end
    end

    context 'with a non-lethal attack that hits' do
      let(:damage) { 1 }

      let(:events) do
        subject.handle(command)
      end

      let(:enemy_took_damage) do
        events.detect do |event|
          event.class == EnemyTookDamageEvent
        end
      end

      it 'results in enemy taking damage' do
        expect(events.first).to eq(enemy_took_damage)

        expect(enemy_took_damage.amount).to eql(damage)
      end

      let(:enemy_attacked) do
        events.detect do |event|
          event.class == EnemyAttackedEvent
        end
      end

      it 'results in the enemy attacking...' do
        expect(events[1]).to eq(enemy_attacked)
      end

      let(:player_took_damage) do
        events.detect do |event|
          event.class == PlayerTookDamageEvent
        end
      end

      it 'results in the player taking damage' do
        expect(events[2]).to eq(player_took_damage)
      end
    end
  end
end

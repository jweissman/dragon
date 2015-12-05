require 'spec_helper'

describe AttackCommandHandler do
  let(:command) do
    instance_double('AttackCommand', enemy: enemy, player: player)
  end

  let(:enemy) do
    instance_double('Enemy', alive?: true, chance_of_hitting: 1.0, attack!: true)
  end

  let(:player) do
    instance_double('Player', alive?: true, chance_of_hitting: 1.0, attack!: damage)
  end

  describe '#handle' do
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

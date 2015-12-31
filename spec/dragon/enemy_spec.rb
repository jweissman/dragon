require 'spec_helper'

describe Enemy do
  it 'should have an entity' do
    entity = instance_double Entity
    enemy = Enemy.new(entity)
    expect(enemy.entity).to eq(entity)
  end

  describe '.generate' do
    let(:challenge_rating) { 1 }

    let(:creature_type) { class_double Creature, new: creature }
    let(:creature) { instance_double Creature, challenge_rating: challenge_rating }

    let(:place) { instance_spy Place, class: place_type }
    let(:place_type) { class_double Place, populated?: false, associated: [ creature_type ]  }

    let(:level) { challenge_rating }
    

    it 'should produce creatures' do
      expect(Enemy).to receive(:new).with(creature)
      described_class.generate(place, level)
    end
  end
end

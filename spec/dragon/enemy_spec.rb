require 'spec_helper'

describe Enemy do
  let(:entity) { instance_double("Entity") }
  subject(:enemy) { Enemy.new(entity) }

  it 'should have an entity' do
    expect(enemy.entity).to eq(entity)
  end

  describe '.generate' do
    let(:generator) { -> { entity }}
    let(:place) { instance_spy 'Place' }
    it 'should sample percentages' do
      expect(Enemy).to receive(:sample_percentages).
        with(Enemy.type_percentages(place)).and_return(generator)

      expect(Enemy).to receive(:new).with(entity).and_return(enemy)
      expect(described_class.generate(place)).to eq(enemy)
    end
  end
end

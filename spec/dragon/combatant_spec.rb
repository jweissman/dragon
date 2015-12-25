require 'spec_helper'


describe Combatant do
  let(:combatant) { Combatant.new }

  let(:weapon) do
    instance_double Weapon, damage_range: (0..1_000)
  end

  let(:armor) do
    instance_double Armor, deflect_range: (0..1_000)
  end

  let(:accessory) do
    instance_double Accessory, deflect_range: (0..1_000), type: 'wristband'
  end

  before do
    combatant.wield!(weapon)
    combatant.wear!(armor)
    combatant.equip!(accessory)
  end

  it 'has a challenge rating' do
    expect(combatant.challenge_rating).to be_an(Integer)
    expect(combatant.challenge_rating).to be > 1
  end
end

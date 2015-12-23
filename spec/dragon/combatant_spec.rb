require 'spec_helper'


describe Combatant do
  let(:combatant) { Combatant.new }

  let(:weapon) do
    instance_double Weapon, damage_range: (0..1_000)
  end

  let(:armor) do
    instance_double Armor, deflect_range: (0..1_000)
  end

  before do
    combatant.weapon = weapon
    combatant.armor  = armor
  end
 
  it 'has a challenge rating' do
    expect(combatant.challenge_rating).to be_an(Integer)
    expect(combatant.challenge_rating).to be > 1
  end
end

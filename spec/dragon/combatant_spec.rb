require 'spec_helper'

# describe Combatant do
# 
#   let(:player) { PlayerCharacter.generate(profession: Professions::Warrior) }
#   let(:turtle) { Creature.generate type: Creatures::Turtle }
#   let(:wolf) { Creature.generate type: Creatures::Wolf }
# 
#   20.times {
#   it 'has good attack rating against a wolf' do
#     expect(player.attack_damage_against(wolf)).to be > 1
#   end
# 
#   it 'does not have TOO good an attack rating against a wolf' do
#     expect(player.attack_damage_against(wolf)).to be <= 15
#   end
# 
#   it 'has weak defense rating against a wolf' do
#     expect(wolf.attack_damage_against(player)).to be > 1
#   end
# 
#   it 'does not have TOO weak a defense rating against a wolf' do
#     expect(wolf.attack_damage_against(player)).to be <= 15
#   end
# 
#   it 'has good attack rating against a turtle' do
#     expect(player.attack_damage_against(turtle)).to be > 1
#   end
# 
#   it 'does not have TOO good an attack rating against a turtle' do
#     expect(player.attack_damage_against(turtle)).to be <= 20
#   end
# 
#   it 'has good defense rating against a turtle' do
#     expect(turtle.attack_damage_against(player)).to eq 1
#   end
#   }
# 
#     # expect(wolf.attack_damage_against(player)).to be > 1
#     # expect(wolf.attack_damage_against(player)).to be < 20
#   #end
# end

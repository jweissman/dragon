require 'spec_helper'

describe AttackCommand do
  subject do
    AttackCommand.new player: player, enemy: enemy
  end

  let(:player) { instance_double(PlayerCharacter, hp: 1, max_hp: 2, weapon: player_weapon, chance_of_hitting: 1.0) }
  let(:player_weapon) { instance_double Weapon, label: 'fists' }

  let(:enemy)  do 
    instance_double('Enemy', hp: 3, max_hp: 4, describe: enemy_description, label: enemy_description)
  end 
  let(:enemy_description) { "a baddie" }

  describe '#label' do
    it 'should indicate the enemy to attack' do
      expect(subject.label).to include(enemy_description)
    end
  end

  describe "#describe" do
    it 'should include the player description' do
      expect(subject.describe).to include(subject.player_description)
    end

    it 'should include the player weapon' do
      expect(subject.describe).to include(player_weapon.label)
    end

    it 'should include the enemy description' do
      expect(subject.describe).to include(subject.enemy_description)
    end
  end

  describe "#player_description" do
    it 'should include the player hp' do
      aggregate_failures 'hp display' do
        expect(subject.player_description).to include(player.hp.to_s)
        expect(subject.player_description).to include(player.max_hp.to_s)
      end
    end
  end

  describe "#enemy_description" do
    it 'should include the enemy hp' do
      aggregate_failures 'hp display' do
        expect(subject.enemy_description).to include(enemy.hp.to_s)
        expect(subject.enemy_description).to include(enemy.max_hp.to_s)
      end
    end
  end

end

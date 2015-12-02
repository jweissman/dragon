require 'spec_helper'
require 'dragon'

describe Engine do
  describe '#step' do
    subject do
      Engine.new terminal: fake_terminal, world: fake_world, player: fake_player
    end
    
    after { subject.step }

    let(:fake_town) { instance_double('Town', random_place: true) }
    let(:fake_place) { instance_double 'Place' }
    let(:fake_scene) { instance_double 'Scene' }

    let(:fake_world) { instance_spy('World') }
    let(:fake_terminal) { instance_double 'GameTerminal' }
    let(:fake_player) { instance_double 'Player' }

    before do
      allow(subject).to receive(:town).and_return(fake_town)
      allow(subject).to receive(:place).and_return(fake_place)
      allow(subject).to receive(:scene).and_return(fake_scene)
    end

    it 'should narrate the scene and interact with the player' do
      expect(fake_terminal).to receive(:narrate).with(
        place: fake_place,
        scene: fake_scene,
        town: fake_town,
        world: fake_world,
        player: fake_player
      )

      expect(subject).to receive(:interact)
    end
  end
end

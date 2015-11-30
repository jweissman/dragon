require 'spec_helper'
require 'dragon'

describe Engine do
  describe '#step' do
    subject do
      Engine.new console: fake_console, world: fake_world, player: fake_player
    end
    
    after { subject.step }

    let(:fake_town) { instance_double('Town', random_place: true) }
    let(:fake_place) { instance_double 'Place' }

    let(:fake_world) { instance_spy('World') }
    let(:fake_console) { instance_double 'GameTerminal' }

    let(:fake_player) { instance_double 'Player' }

    let(:fake_scene) { instance_double 'Scene' }

     before do
       allow(subject).to receive(:town).and_return(fake_town)
       allow(subject).to receive(:place).and_return(fake_place)
       allow(subject).to receive(:scene).and_return(fake_scene)
     end

    it 'should narrate the scene and interact with the player' do
      expect(fake_console).to receive(:narrate).with(
        place: fake_place,
        scene: fake_scene,
        town: fake_town,
        world: fake_world
      )

      expect(subject).to receive(:interact)
    end
  end
end

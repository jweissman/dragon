require 'spec_helper'
require 'dragon/console'
require 'dragon/game_terminal' 

describe GameTerminal do
  describe '#narrate' do
    let(:fake_town) { instance_spy('Town') }
    let(:fake_world) { instance_spy('World') }

    before do
      subject.narrate(world: fake_world, town: fake_town)
    end

    it 'should dramatize surroundings' do
      aggregate_failures 'describe the world and town' do
        expect(fake_world).to have_received(:describe)
        expect(fake_town).to have_received(:describe)
      end
    end
  end
end


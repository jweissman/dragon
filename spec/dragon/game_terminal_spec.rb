require 'spec_helper'
require 'dragon/console'
require 'dragon/game_terminal' 

describe GameTerminal do
  describe '#narrate' do
    subject do
      GameTerminal.new(fake_console)
    end

    let(:fake_console) { instance_double('Console', 
                                         hr: true, say: true) }
    let(:fake_city)    { instance_spy('City') }
    let(:fake_world)   { instance_spy('World') }
    let(:fake_player)  { instance_spy('Player') }

    before do
      subject.narrate(world: fake_world, city: fake_city, player: fake_player)
    end

    it 'should dramatize surroundings' do
      aggregate_failures 'describe the world and town' do
        expect(fake_world).to have_received(:describe)
        expect(fake_city).to  have_received(:describe)
        expect(fake_player).to have_received(:describe)
      end
    end
  end
end


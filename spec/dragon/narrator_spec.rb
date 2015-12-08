require 'spec_helper'
require 'dragon/console'
require 'dragon/game_terminal'

describe Narrator do
  describe '#dramatize' do
    subject do
      Narrator.new(
        terminal: terminal,
        world: fake_world, 
        city: fake_city, 
        place: fake_place,
        player: fake_player,
        scene: fake_scene
      )
    end

    let(:terminal) do
      instance_double('GameTerminal', 
                      console: fake_console, 
                      say: true) 
    end


    let(:fake_console) { instance_double('Console') }
    let(:fake_city)    { instance_spy('City') }
    let(:fake_world)   { instance_spy('World') }
    let(:fake_place)   { instance_spy('Place') }
    let(:fake_player)  { instance_spy('Player') }
    let(:fake_scene)   { instance_spy('Scene') }

    before do
      subject.dramatize
    end

    it 'should dramatize surroundings' do
      aggregate_failures 'describe the world and town' do
        expect(fake_world).to have_received(:describe)
        expect(fake_city).to  have_received(:describe)
        expect(fake_place).to have_received(:describe)

        expect(fake_scene).to have_received(:describe).at_least(:once)

        expect(fake_player).to have_received(:describe)
      end
    end
  end
end


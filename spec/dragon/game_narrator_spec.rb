require 'spec_helper'
require 'dragon/console'
require 'dragon/game_terminal'

describe GameNarrator do
  describe '#dramatize' do
    subject(:game_narrator) do
      GameNarrator.new(game) #, terminal: terminal)
    end

    let(:terminal) do
      instance_double('GameTerminal',
                      console: console,
                      say: true)
    end

    let(:game)    { instance_double("Game", scene: scene, world: world, city: city, current_place: place, player: player) }

    let(:console) { instance_double('Console') }
    let(:city)    { instance_spy('City') }
    let(:world)   { instance_spy('World') }
    let(:place)   { instance_spy('Place') }
    let(:player)  { instance_spy('Player') }
    let(:scene)   { instance_spy('Scene', squelch_narration?: false) }
    let(:command) { instance_double("Command") }
    let(:event)   { instance_double("Event") }

    let(:narrator) { instance_double("Narrator") }

    before do
      allow(scene).to receive(:narrator).and_return(narrator)
      allow(scene).to receive(:squelch_narration?).and_return(false)
      allow(narrator).to receive(:narrate).with(terminal, command, [event])
    end

    it 'should narrate the world' do
      world_narrator = instance_double 'WorldNarrator'
      expect(world).to receive(:narrator).and_return(world_narrator)
      expect(world_narrator).to receive(:narrate)
    end

    after do
      game_narrator.narrate(terminal, command, [event])
    end
  end
end


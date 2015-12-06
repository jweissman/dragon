require 'spec_helper'
require 'dragon'

describe Engine do
  describe '#step' do
    subject do
      Engine.new terminal: fake_terminal, world: fake_world, player: fake_player
    end
    
    after { subject.step }

    let(:fake_city) { instance_double('City', random_place: true) }
    let(:fake_place) { instance_double 'Place' }
    let(:fake_scene) { instance_double 'Scene' }

    let(:fake_world) { instance_spy('World') }
    let(:fake_terminal) { instance_double 'GameTerminal' }
    let(:fake_player) { instance_double 'Player' }

    before do
      allow(subject).to receive(:city).and_return(fake_city)
      allow(subject).to receive(:place).and_return(fake_place)
      allow(subject).to receive(:scene).and_return(fake_scene)
    end

    it 'should narrate the scene and interact with the player' do
      expect(fake_terminal).to receive(:narrate).with(
        place: fake_place,
        scene: fake_scene,
        city: fake_city,
        world: fake_world,
        player: fake_player
      )

      expect(subject).to receive(:interact)
    end
  end

  describe "#process" do
    let(:listener) { instance_spy('EventListener') }

    let(:event_class) { instance_double('EventListener.class', listener: listener, name: '') }
    let(:event)    { instance_spy('Event', class: event_class) }
    let(:events)   { [event] }

    it 'should check events against listeners' do
      subject.process(events)
      expect(listener).to have_received(:receive).with(event)
    end

    context 'processing known saga groups' do 
      let(:player) { instance_double('Player', quests: quests) }
      let(:quests) { [ quest ] }
      let(:quest) { instance_spy('Quest') }
      it 'should process events against player quests' do
        allow(subject).to receive(:player).and_return(player)
        subject.process(events)
        expect(quest).to have_received(:receive).with(event)
      end
    end
  end
end

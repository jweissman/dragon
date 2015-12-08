require 'spec_helper'
require 'dragon'

describe Engine do
  describe '#describe' do
    let(:scene) { instance_double('Scene', squelch_narration?: true) }
    let(:narrator) { instance_double('Narrator') }

    it 'should narrate the scene' do
      allow(subject).to receive(:scene).and_return(scene)
      allow(subject).to receive(:narrator).and_return(narrator)

      expect(narrator).to receive(:dramatize_scene).with(scene)

      subject.describe
    end
  end

  describe '#step' do
    subject do
      Engine.new
    end

    after { subject.step }

    it 'should describe the world and permit player interaction' do
      expect(subject).to receive(:describe)
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
      expect(listener).to have_received(:on).with(event)
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

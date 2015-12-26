require 'spec_helper'
require 'dragon'

describe Engine do
  let(:game) do
    instance_double(Game, player: player)
  end

  let(:player) do
    instance_double(PlayerCharacter)
  end

  subject(:engine) { Engine.new(game: game) }

  describe "#react" do
    let(:event) { instance_double("Event") }
    let(:handler) { instance_double("CommandHandler", handle: [ event ]) }
    let(:command_class) { instance_double("Command.class", handler: handler, name: 'synthetic') }
    let(:action) { instance_double("Command", class: command_class)  }

    it 'remembers the action' do
      expect(engine).to receive(:process).with([event])
      engine.react(action)
      expect(engine.last_command).to eq(action)
    end
  end

  describe "#process" do
    let(:listener)    { instance_spy('EventListener', on: []) }

    let(:event_class) { instance_double('EventListener.class',
                                        listener: listener,
                                        name: '') }
    let(:event)       { instance_spy('Event', class: event_class) }
    let(:events)      { [event] }

    it 'should check events against listeners' do
      engine.process(events)
      expect(listener).to have_received(:on).with(event)
    end

    context 'processing known saga groups' do
      let(:quest) { instance_spy('Quest', receive: nil) }

      it 'should process events against player quests' do
        engine.process(events, sagas: [ quest ])

        expect(quest).to have_received(:receive).with(event)
      end
    end
  end
end

require 'spec_helper'
require 'dragon'

describe Console do
  let(:fake_object) { double('any entity') }
  let(:fake_response) { 'anything' }
  let(:fake_attribute) { :something }

  describe '#ask' do
    let(:prompt) { "Say something please: " }

    before do
      allow(subject).to receive(:gets).and_return(fake_response)
    end

    after do
      subject.ask(fake_attribute, of: fake_object, prompt: prompt)
    end

    it 'should gather user response and assign appropriately' do
      aggregate_failures "prompt and response handling" do
        expect(subject).to receive(:say).with(prompt, heading: true, newline: false)
        expect(fake_object).to receive(:"#{fake_attribute}=").with(fake_response)
      end
    end
  end

  describe '#choose' do
    let(:prompt) { "Select one please: " }
    let(:fake_response) { '4' }
    let(:choices) { %w[ foo bar baz quux ] }
    let(:expected_choice) { choices[fake_response.to_i-1] }

    before do
      allow(subject).to receive(:gets).and_return(fake_response)
    end

    after do
      subject.choose(fake_attribute, of: fake_object, prompt: prompt, choices: choices)
    end

    it 'should gather the user choice and assign selection' do
      expect(fake_object).to receive(:"#{fake_attribute}=").with(expected_choice)
    end

  end
end

describe World do
  subject { World.new 'fake', 'place', 'imaginary', 'lies' }
  describe "#describe" do
    it 'should indicate the name of the world' do
      expect(subject.describe).to include(subject.name)
    end
  end
end

describe PlayerCharacter do
  it 'has expected attributes' do
    aggregate_failures 'player stats' do
      expect { subject.name = 'Bob' }.not_to raise_error
      expect { subject.age = 25 }.not_to raise_error
      expect { subject.gender = 'other' }.not_to raise_error
    end
  end
end

describe Game do
  # functional
  context 'with realistic collaborators/spies' do
    let(:console) { instance_spy('GameTerminal') }
    # let(:player)  { Player.new}

    before do
        allow(subject).to receive(:still_playing?).and_return(false)
      allow(subject).to receive(:console).and_return(console)
    end

    let(:player) { subject.send(:player) }

    it 'should create characters' do
      subject.play

      expect(console).to have_received(:ask).at_least(:once)
      expect(console).to have_received(:ask).with(:age, of: player)
      expect(console).to have_received(:ask).with(:gender, of: player)
      # expect(console).to have_received(:ask).with(:race, of: player)
    end
  end

  # unit
  context 'when collaborators are entirely mocked' do
    let(:fake_name)            { 'anything' }

    let(:fake_selection)       { :aristocrat }
    let(:fake_character_types) { ['aristocrat'] }

    let(:fake_console)    { instance_double('GameTerminal') }

    let(:fake_player)     { instance_double('Player', 
      name: fake_name, 
      type: fake_selection
    ) }

    let(:fake_world)      { instance_double( 'World', 
      name: 'Ea', 
      type: 'Realm', 
      subtype: 'Plentiful', 
      wonder: 'Legends',
      describe: 'Awesome'
    ) }

    let(:fake_action_choices) { [ :gossip, :tell_joke_about_martians ] }

    describe '#play' do

      before do
        # internal behavior being mocked, maybe we can avoid this
        allow(fake_player).to receive(:action).and_return(:gossip, :quit)
        #allow(subject).to receive(:still_playing?).and_return(false)

        allow(subject).to receive(:console).and_return(fake_console)
        allow(subject).to receive(:player).and_return(fake_player)
        allow(subject).to receive(:world).and_return(fake_world)

        allow(fake_console).to receive(:ask)
        allow(fake_console).to receive(:ask).with(:name, 
                                                  of: fake_player, 
                                                  prompt: PLAYER_NAME_PROMPT)

        allow(fake_console).to receive(:ask).with(:age, of: fake_player) 
        allow(fake_console).to receive(:ask).with(:gender, of: fake_player) 

        allow(subject).to receive(:character_types).and_return(fake_character_types)
        allow(fake_console).to receive(:choose).with(:type, 
                                                     of: fake_player, 
                                                     prompt: PLAYER_TYPE_PROMPT, 
                                                     choices: fake_character_types)

        allow(subject).to receive(:available_actions).and_return(fake_action_choices)
        allow(fake_console).to receive(:choose).with(:action, of: fake_player, prompt: PLAYER_ACTION_PROMPT, choices: fake_action_choices)

        allow(fake_console).to receive(:banner)
        allow(fake_console).to receive(:welcome).with(fake_player)

        allow(fake_console).to receive(:say)
      end

      after { subject.play }

      context 'character creation' do
        it 'shall ask the player attributes' do
          aggregate_failures "including name, age and gender" do
            expect(subject).to receive(:ask).with(:name, of: fake_player, prompt: PLAYER_NAME_PROMPT).ordered
            expect(subject).to receive(:ask).with(:age, of: fake_player).ordered
            expect(subject).to receive(:ask).with(:gender, of: fake_player).ordered
          end
        end

        it 'shall ask the player to choose a character type' do
          expect(fake_console).to receive(:choose).with(:type, of: fake_player, prompt: "What sort of adventurer are you?", choices: fake_character_types)
        end

        it 'shall greet the player' do
          expect(subject).to receive(:welcome)
        end
      end

      xcontext 'playing the game' do
        xit 'should present options' do
        end
      end

      it 'shall display the banner' do
        expect(subject).to receive(:banner)
      end

      it 'shall describe the world' do
        # allow(fake_player).to receive(:action)
        # allow(fake_player).to receive(:action).and_return(:gossip, :quit)
        expect(subject).to receive(:describe_world)
      end

      it 'shall describe the town' do
        expect(subject).to receive(:describe_town)
      end
    end
  end
end

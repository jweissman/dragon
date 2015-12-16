require 'spec_helper'
require 'dragon/console'

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

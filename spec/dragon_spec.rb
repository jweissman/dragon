require 'spec_helper'
require 'dragon'

describe Dragon do
  it "should have a VERSION constant" do
    expect(subject.const_get('VERSION')).to_not be_empty
  end
end

describe Game do
  describe '#play!' do
    after { subject.play! }

    it 'shall display the banner' do
      expect(subject).to receive(:puts).with(Dragon.welcome)
    end
  end
end

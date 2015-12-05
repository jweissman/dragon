require 'spec_helper'

require 'dragon'


describe Town do
  describe '#random_place' do
    it 'selects a place in town randomly' do
      place = subject.random_place
      expect(place).to be_a(Place)
    end
  end

  describe '#describe' do
    let(:name)    { 'anytown' }
    let(:subtype) { 'plausible' }
    let(:feature) { 'mockery' }

    subject { Town.new(name, subtype, feature) }

    it 'should indicate the name' do
      expect(subject.describe).to include(name)
    end
  end
end


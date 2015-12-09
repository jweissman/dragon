require 'spec_helper'
require 'dragon'


describe City do
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

    subject { City.new(name, subtype: subtype, feature: feature) }

    it 'should indicate the name' do
      expect(subject.describe).to include(name)
    end
  end

  describe ".generate" do
    subject { City.generate(world) }
    let(:world) { instance_double('World') }
    it 'should be of the expected types' do
      expect(City.types).to include(subject.class)
    end
  end
end

require 'spec_helper'
require 'dragon'

include Dragon::Cities
include Dragon::Areas

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
    subject(:city) { City.generate(world, type) }

    let(:world) { instance_double('World') }
    let(:type) { Capital }

    it 'should be of the expected types' do
      expect(City.types).to include(subject.class)
    end

    it 'should have one castle' do
      castles = city.buildings.select { |building| building.is_a? Castle }
      expect(castles.count).to eq(1)
    end

    it 'should have one square' do
      squares = city.areas.select { |area| area.is_a? Square }
      expect(squares.count).to eq(1)
    end
  end

  City.types.each do |city_type|
    CitySubtype.types.each do |subtype|
      context "#{subtype.name.split('::').last} #{city_type.name.split('::').last} should generate buildings/areas" do
        subject(:city) { city_type.new(subtype: subtype) }
        describe "should have buildings" do
          let(:buildings) { city.buildings }
          it 'has more than one building' do
            expect(buildings).not_to be_empty
            expect(buildings.size).to be > 1
            expect(buildings).to all(be_a(Building))
          end
        end
      end
    end
  end
end

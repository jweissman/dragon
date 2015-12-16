require 'spec_helper'

describe Building do
  let(:world) { instance_double("World") }

  it 'should generate rooms' do
    aggregate_failures 'buildings that cannot generate rooms' do
      City.types.each do |city_type| 
        city = City.generate(world, city_type)
        Building.types.each do |type|
          if type.available_in?(city)
            building = Building.generate(city, type)
            expect(building.rooms).not_to be_empty, "Expected #{type} to be able to generate rooms"
            expect(building.rooms).to all(be_a(Room))
          end
          print '.'
        end
      end
    end
  end
end

require 'spec_helper'
require 'sim_helper'

describe "a simulated gauntlet", speed: 'slow' do
  before(:all) do
    @world = World.new
  end

  let(:world) { @world }
  let(:battles) { 100 }

  context 'by profession' do
    Profession.adventuring.each do |profession|
      describe "#{profession.new(nil).label}" do
        let(:sim) do
          Simulation.new(profession: profession, world: world, battles: battles)
        end

        let(:victory_rate) { sim.driver.victory_ratio }

        it "should have a decent victory rate" do
          aggregate_failures 'victory ratio between 50% and 90%' do
            expect(victory_rate).to be > 0.5
            expect(victory_rate).to be < 0.95
          end
        end
      end
    end
  end

  xcontext 'by level'
end

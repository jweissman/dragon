require 'spec_helper'

describe Person do
  context '.generate' do
    subject(:person) do
      Person.generate(name: name)
    end

    let(:name) { 'Aloysius' }

    it 'should have an appropriate label' do
      expect(person.label).to include(subject.profession.type)
      expect(person.label).to include(name)
    end

    it 'should have an activity' do
      expect(person.activity).not_to be_nil
      expect(person.activity).to be_a(Activity)
    end

    context '#questions' do
      let(:questions) { person.questions(place) }
      let(:place) { instance_double('Place') }

      it 'produces a set of questions' do
        expect(questions).to all(be_a(Question))
      end
    end

    context "#actions" do
      context 'when a quest may be redeemed' do
        let(:actions) { person.actions(player) }
        let(:player) { instance_double('Player', quests: [ quest ]) }
        let(:quest) { instance_double('Quest', completed?: true, requestor: person) }

        let(:redeem_quest) do
          actions.detect { |a| a.is_a?(RedeemQuestCommand) }
        end

        it 'produces a list of commands' do
          expect(actions).to all(be_a(Command))
        end

        it 'offers the quest for redemption' do
          expect(redeem_quest).not_to be_nil
          expect(redeem_quest.quest).to eql(quest)
        end
      end
    end
  end
end

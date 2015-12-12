require 'spec_helper'

describe Person do
  context '.generate' do
    subject do
      Person.generate(name: name, profession: profession_class)
    end

    let(:profession_class) do
      instance_double('Profession.class', new: profession)
    end

    let(:profession) do
      instance_double('Profession', type: profession_type, questions: [], activities: [])
    end

    let(:name) { 'Aloysius' }
    let(:profession_type) { 'windowcleaner' }

    it 'should have an appropriate label' do
      expect(subject.label).to include(profession.type)
      expect(subject.label).to include(name)
    end

    it 'should have an activity' do
      expect(subject.activity).not_to be_nil
      expect(subject.activity).to be_a(Activity)
    end

    context '#questions' do
      let(:questions) { subject.questions(place) }
      let(:place) { instance_double('Place') }

      it 'produces a set of questions' do
        expect(questions).to all(be_a(Question))
      end
    end

    context "#actions" do
      context 'when a quest may be redeemed' do
        let(:actions) { subject.actions(player) }
        let(:player) { instance_double('Player', quests: [ quest ]) }
        let(:quest) { instance_double('Quest', completed?: true, requestor: subject) }

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

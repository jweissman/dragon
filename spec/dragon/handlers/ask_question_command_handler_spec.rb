require 'spec_helper'

describe AskQuestionCommandHandler do
  let(:ask_question_command) do
    instance_double('AskQuestionCommand', partner: partner, topic: topic)
  end

  let(:engine) do
    instance_double('Engine', player: player)
  end

  let(:player) do
    instance_double('Player', quests: quests)
  end

  let(:quests) { [] }

  let(:topic) do
    instance_double('ConversationTopic', 
                    responses: responses, 
                    about_missions?: about_missions?,
                    about_activity?: false)
  end

  let(:about_missions?) { false } 

  let(:responses) { %w[ okay! what? ] }

  let(:partner) do
    instance_double('Person')
  end

  describe '#handle' do
    let(:events) do
      subject.handle(ask_question_command)
    end
    
    let(:words_spoken) do
      events.detect { |e| e.is_a? WordsSpokenEvent }
    end

    it 'results in words being spoken' do
      expect(words_spoken.person).to eq(partner)
      expect(topic.responses).to include(words_spoken.message)
    end

    context 'a question about missions' do
      let(:about_missions?) { true }

      let(:quest_offered) do
        events.detect { |e| e.is_a? QuestOfferedEvent }
      end

      let(:quests) { [] }
      let(:quest) do
        instance_double('Quest', requestor: partner, completed?: completed_quest)
      end
      let(:completed_quest) { false }

      before do
        allow(subject).to receive(:engine).and_return(engine)
        allow(subject).to receive(:quests_for).with(partner).and_return([quest])
      end

      it 'results in a quest offer' do
        expect(quest_offered).not_to be_nil
        expect(quest_offered.quest).to eql(quest)
      end

      context 'when there are completed quests' do
        let(:completed_quest) { true }
        let(:quests) { [ quest ] }

        let(:quest_redemption_offered) do
          events.detect { |e| e.is_a? QuestRedemptionOfferedEvent }
        end

        it 'should offer to redeem them' do
          expect(quest_redemption_offered).not_to be_nil
          expect(quest_redemption_offered.quest).to eql(quest)
        end
      end
    end
  end
end

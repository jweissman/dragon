require 'spec_helper'

describe AskQuestionCommandHandler do
  subject(:ask_question_command_handler) { AskQuestionCommandHandler.new }

  let(:ask_question_command) do
    instance_double('AskQuestionCommand', partner: partner, question: question)
  end

  let(:engine) { instance_double('Engine', game: game) }
  let(:game)   { instance_double('Game', player: player) }
  let(:player) { instance_double('Player', quests: quests) }

  let(:quests) { [] }

  let(:question) do
    instance_double('Question', 
                    responses: responses, 
                    topic: conversation_topic,
                    about?: false)
  end

  let(:conversation_topic) do
    instance_double('Object')
  end

  let(:about_missions?) { false } 
  let(:responses) { %w[ okay! what? ] }

  let(:partner) do
    instance_double('Person')
  end

  describe '#handle' do
    let(:events) do
      ask_question_command_handler.handle(ask_question_command)
    end
    
    let(:words_spoken) do
      events.detect { |e| e.is_a? WordsSpokenEvent }
    end

    it 'results in words being spoken' do
      expect(words_spoken.person).to eq(partner)
      expect(question.responses).to include(words_spoken.message)
    end

    context 'a question about missions' do
      let(:quest_offered) do
        events.detect { |e| e.is_a? QuestOfferedEvent }
      end

      let(:quests) { [] }

      let(:quest) do
        instance_double('Quest', 
                        requestor: partner, 
                        completed?: completed_quest, 
                        describe: "to do a thing",
                        reward: reward)
      end

      let(:reward) do
        instance_double('Item', describe: "an awesome item")
      end

      let(:completed_quest) { false }

      before do
        allow(ask_question_command_handler).to receive(:engine).and_return(engine)
        allow(ask_question_command_handler).to receive(:generate_quests_for).with(partner).and_return([quest])

        allow(question).to receive(:about?).with(Quest).and_return(true)
      end

      it 'results in a quest offer' do
        expect(quest_offered).not_to be_nil
        expect(quest_offered.quest).to eql(quest)
      end

      context 'when there are completed quests' do
        let(:completed_quest) { true }
        let(:quests) { [ quest ] }

        it 'should indicate it can be redeemed' do
          expect(words_spoken).not_to be_nil

          expect(words_spoken.message).to include("redeem")
          expect(words_spoken.message).to include(quest.describe)
          expect(words_spoken.message).to include(quest.reward.describe)
        end
      end
    end
  end
end

require 'spec_helper'

describe AskQuestionCommandHandler do
  let(:ask_question_command) do
    instance_double('AskQuestionCommand', partner: partner, topic: topic)
  end

  let(:topic) do
    instance_double('ConversationTopic', responses: responses, about_activity?: false)
  end

  let(:responses) { %w[ okay! what? ] }

  let(:partner) do
    instance_double('Person')
  end

  describe '#handle' do
    it 'results in words being spoken' do
      event = subject.handle(ask_question_command)

      expect(event).to be_a(WordsSpokenEvent)
      expect(event.person).to eq(partner)
      expect(topic.responses).to include(event.message)
    end
  end
end

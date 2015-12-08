require 'spec_helper'

describe Dragon::Scenes::Conversation do
  subject do
    Conversation.new(engine: engine).with(partner: person)
  end

  let(:actions) { subject.actions(place) }

  let(:place) do
    instance_double("Place")
  end

  let(:person) do
    instance_double("Person", questions: [ question ], actions: [], conversation_topics: [])
  end

  let(:question) do
    instance_double('Question')
  end

  let(:engine) do
    instance_double("Engine", last_events: [], player: player)
  end

  let(:player) do
    instance_double('PlayerCharacter', actions: [])
  end

  let(:ask_question_command) do
    actions.detect { |a| a.is_a?(AskQuestionCommand) }
  end

  it 'should indicate possible commands' do
    expect(actions).to all(be_a(Command))
  end

  it 'should suggest questions to pose' do
    expect(ask_question_command.question).to eq(question)
  end
end

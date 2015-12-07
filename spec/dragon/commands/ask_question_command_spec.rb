require 'spec_helper'

describe AskQuestionCommand do
  subject do
    AskQuestionCommand.new(question: question, partner: partner)
  end

  let(:partner) do
    instance_double('Person', name: 'Alice')
  end

  let(:question) do
    instance_double('Question', describe: description)
  end

  let(:description) do
    "about the sun"
  end

  describe '#label' do
    it 'should include a description of the topic' do
      expect(subject.label).to include(description)
    end

    it 'should include the partners name' do
      expect(subject.label).to include(partner.name)
    end
  end

  describe '#describe' do
    it 'should include a description of the topic' do
      expect(subject.describe).to include(description)
    end

    it 'should include the partners name' do
      expect(subject.describe).to include(partner.name)
    end
  end
end

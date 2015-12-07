module Dragon
  class Quest < Saga
    attr_reader :requestor

    def initialize(requestor: nil)
      @requestor = requestor
      @completed = false
    end

    def completed?
      @completed
    end

    def reward
      @reward ||= Item.generate
    end
  end
end

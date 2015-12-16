module Dragon
  class EventBus
    attr_reader :engine

    def initialize(engine: self)
      @engine = engine
    end

    def process_event(event, player: nil, sagas: [])
      additional_events = []

      if sagas.any?
        sagas.each do |saga|
          additional_events << saga.receive(event)
        end
      end

      if event.class.listener(engine)
        additional_events << event.class.listener(engine).on(event)
      end

      additional_events.flatten.compact
    end
  end
end

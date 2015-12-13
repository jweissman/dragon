module Dragon
  class Saga < Entity
    include Events

    def on(event)
      raise "override EventListener#on(event) in subclass"
    end

    def receive(event)
      if self.class.listening_for?(event.class) && is_relevant?(event)
        on(event)
      end
    end

    def is_relevant?(evt)
      true
    end

    def self.listening_for?(klass)
      listening_for.include?(klass)
    end

    def self.listening_for
      []
    end
  end
end

module Dragon
  class Event
    def self.listener(engine)
      klass = Object.const_get("Dragon::Listeners::" + self.name.split('::').last + "Listener") rescue nil
      return klass.new(engine) if klass
      false
    end

    def describe?
      true
    end

    def describe
      raise 'override Event#describe in subclass'
    end

    def actions
      []
    end

    def narrator(terminal)
      EventNarrator.new(self, terminal: terminal)
    end
  end
end

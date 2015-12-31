module Dragon
  class Event
    include Commands
    include Helpers::CommandHelpers

    def self.listener(engine)
      klass = Object.const_get("Dragon::Listeners::" + self.name.split('::').last + "Listener") rescue nil
      return klass.new(engine) if klass
      false
    end

    def to_s
      if describe?
        describe
      else
        self.class.name.split('::').last
      end
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

    def narrator
      EventNarrator.new(self)
    end
  end
end

module Dragon
  class Event
    def self.listener
      klass = Object.const_get("Dragon::Listeners::" + self.name.split('::').last + "Listener") rescue nil
      return klass.new if klass
      false
    end

    def describe
      raise 'override Event#describe in subclass'
    end

    def actions
      []
    end
  end
end

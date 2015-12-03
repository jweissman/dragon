module Dragon
  class Command
    include Dragon::Handlers

    def self.handler(engine)
      Object.const_get("Dragon::Handlers::" + self.name.split('::').last + "Handler").new(engine)
    end

    def describe
      raise 'override Command#describe in subclass'
    end

    def label
      raise 'override Command#label in subclass'
    end
  end
end

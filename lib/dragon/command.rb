module Dragon
  class Command
    include Dragon::Handlers

    def self.handler(engine)
      Object.const_get("Dragon::Handlers::" + self.name.split('::').last + "Handler").new(engine)
    end
  end
end

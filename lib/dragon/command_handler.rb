module Dragon
  class CommandHandler < Struct.new(:engine)
    include Dragon::Events

    def handle(command)
      raise "override CommandHandler#handle(command) in subclass"
    end
  end
end

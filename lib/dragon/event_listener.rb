module Dragon
  class EventListener < Struct.new(:engine)
    def on(event)
      raise "override EventListener#on(event) in subclass"
    end
  end
end

module Dragon
  class EventListener < Struct.new(:engine)
    include Events
    def on(event)
      raise "override EventListener#on(event) in subclass"
    end
  end
end

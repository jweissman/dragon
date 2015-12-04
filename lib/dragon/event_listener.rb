module Dragon
  class EventListener
    def receive(event)
      raise "override EventListener#receive(event) in subclass"
    end
  end
end

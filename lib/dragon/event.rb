module Dragon
  class Event
    def describe
      raise 'override Event#describe in subclass'
    end

    def actions
      []
    end
  end
end

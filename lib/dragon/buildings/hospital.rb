module Dragon
  class Hospital < Building
    tagged :healing, :learning

    def required_types
      [ Nurse ]
    end

    def room_types
      [ Ward, Surgery, Nursery, Hall ]
    end

    def self.unique
      false
    end
  end
end

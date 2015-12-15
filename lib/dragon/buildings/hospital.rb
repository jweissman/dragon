module Dragon
  class Hospital < Building
    tagged :medicine, :healing, :learning, :meeting

    def required_professions
      [ Nurse ]
    end
  end
end

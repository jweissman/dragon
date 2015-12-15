module Dragon
  class Church < Building
    tagged :holy, :learning, :meeting, :praying

    def required_professions
      [ Priest ]
    end
  end
end

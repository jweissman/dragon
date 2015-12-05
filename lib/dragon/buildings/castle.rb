module Dragon
  class Castle < Building
    def unique?
      true
    end

    def associated_professions
      %w[ king queen noble soldier ]
    end
  end
end

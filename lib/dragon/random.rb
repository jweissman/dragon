module Dragon
  module Random
    def sample_percentages(percentage_map)
      sum = percentage_map.keys.inject(&:+)
      roll = (rand * sum).ceil
      choice = nil

      acc = 0

      percentage_map.each do |percentage, value|
        acc += percentage
        if acc >= roll
          choice = value
          break
        end
      end

      choice
    end
  end
end

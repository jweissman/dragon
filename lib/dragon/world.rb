module Dragon
  class World < Struct.new(:name, :type, :subtype, :wonder)
    def describe
      "#{name}, #{subtype} #{type} of #{wonder}"
    end
  end
end



module Dragon
  class Town < Struct.new(:name, :type, :subtype)
    def describe
      "#{name}, #{type} town of #{subtype}"
    end
  end
end

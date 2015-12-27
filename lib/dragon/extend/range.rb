class Range
  def +(value)
    if value.is_a?(Integer)
      return ((self.begin + value)..(self.end + value))
    elsif value.is_a?(Range)
      return ((self.begin + value.begin)..(self.end + value.end))
    else
      raise "Can't add #{value.class.name} to range"
    end
  end

  def to_s
    "#{self.begin}-#{self.end}"
  end
end



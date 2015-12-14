module Dragon
  class Race < Entity
    attr_reader :subtype

    def initialize
      @subtype ||= Subtype.generate_for(self)
      super
    end

    def to_s
      "#{subtype.type} #{type}"
    end
  end

  class Human   < Race; end
  class Dwarf   < Race; end
  class Elf     < Race; end
  class Gnome   < Race; end
  class Orc     < Race; end
  class Centaur < Race; end
end

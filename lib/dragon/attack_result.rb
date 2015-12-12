module Dragon
  class AttackResult
    attr_reader :amount

    def dodge?; false end
    def ko?; false end
    def hit?; false end
  end

  class Dodge < AttackResult
    def dodge?; true end
  end

  class Knockout < AttackResult
    def ko?; true end
  end

  class Damage < AttackResult
    def initialize(amount: nil)
      @amount = amount
    end

    def hit?; true end
  end
end

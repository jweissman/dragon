module Dragon
  class Profession
    def type
      self.class.name.split('::').last
    end

    def label; type end

    def self.all
      basic + noble + adventuring
    end

    def self.basic
      [ Student, Teacher, Drunk, Barkeep,
        Bard, Gambler, Priest, Conscript, Jester, Scribe ]
    end

    def self.noble
      [ Minister, Bishop, Princess, Prince, Queen, King ]
    end

    def self.adventuring
      [ Warrior, Wizard, Soldier, Rogue, Cleric ]
    end
  end

  class Student < Profession; end
  class Teacher < Profession; end
  class Drunk < Profession; end
  class Barkeep < Profession; end
  class Bard < Profession; end
  class Gambler < Profession; end
  class Priest < Profession; end
  class Conscript < Profession; end
  class Jester < Profession; end
  class Scribe < Profession; end
  class Acolyte < Profession; end

  class Noble < Profession
    def self.unique?
      true
    end
  end

  class Minister < Noble; end
  class Bishop < Noble; end
  class Princess < Noble; end
  class Prince < Noble; end
  class Queen < Noble; end
  class King < Noble; end

  class Adventurer < Profession
    def default_max_hp
      50
    end
  end

  class Warrior < Adventurer
    def default_max_hp
      60
    end
  end

  class Wizard < Adventurer
    def default_max_hp
      14
    end
  end

  class Soldier < Adventurer
    def default_max_hp
      35
    end
  end

  class Rogue < Adventurer
    def default_max_hp
      26
    end
  end

  class Cleric < Adventurer
    def default_max_hp
      16
    end
  end
end

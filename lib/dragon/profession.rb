module Dragon
  class Profession
    include Activities
    include Questions
    include Professions

    def type
      self.class.name.split('::').last
    end

    def label; type end

    def questions(*)
      []
    end

    def conversation_topics
      []
    end

    def activities
      []
    end

    def self.unique?
      false
    end

    def self.all
      basic + noble + adventuring + epic
    end

    def self.basic
      [
        Sage, Trader, Student, Teacher,
        Drunk, Barkeep, Bard, Gambler, Priest,
        Conscript, Jester, Scribe, Acolyte,
        Beggar, Farmer, Constable
      ]
    end

    def self.noble
      [
        Judge, Minister, Bishop, Princess, Prince, Queen, King
      ]
    end

    def self.adventuring
      [
        Warrior, Wizard, Soldier, Rogue, Monk, Cleric, Paladin
      ]
    end

    def self.epic
      [
        Archmage, Necromancer, Pyromancer, Ninja, Pirate
      ]
    end
  end

  class Priest < Profession; end
  class Conscript < Profession; end

  class Jester < Profession
    def activities
      [ Juggling ]
    end
  end

  class Scribe < Profession; end
  class Acolyte < Profession; end
  class Beggar < Profession; end
  class Farmer < Profession; end
  class Constable < Profession; end
end

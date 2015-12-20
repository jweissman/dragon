module Dragon
  class Profession < Entity
    include Activities
    include Questions
    include Professions

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

  class Priest < Profession
    tagged :healing
  end

  class Conscript < Profession
    tagged :military, :fighting 
  end

  class Jester < Profession
    tagged :comedy, :entertainment

    def activities
      [ Juggling ]
    end
  end

  class Scribe < Profession
    tagged :books, :lore, :writing, :drafting

    def conversation_topics
      [ Topics::Lore ]
    end
  end
  
  class Acolyte < Profession
    tagged :holy, :books, :learning
  end

  class Beggar < Profession; tagged :poverty end
  class Farmer < Profession; tagged :agriculture, :farming end

  class Constable < Profession
    tagged :law
  end

  class Nurse < Profession; tagged :medicine, :healing end
end

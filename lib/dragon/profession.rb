module Dragon
  class Profession
    def type
      self.class.name.split('::').last
    end

    def label; type end

    def conversation_topics
      [
        AskForQuests.new
      ]
    end

    def self.unique?
      false
    end

    def self.all
      basic + noble + adventuring + epic
    end

    def self.basic
      [
        Student, Teacher, Drunk, Barkeep, Bard, Gambler,
        Priest, Conscript, Jester, Scribe, Acolyte, Trader,
        Beggar, Farmer, Constable
      ]
    end

    def self.adventuring
      [
        Warrior, Wizard, Soldier, Rogue, Monk, Cleric, Paladin
      ]
    end

    def self.epic
      [
        Archmage, Necromancer, Pyromancer, Sage, Ninja
      ]
    end

    def self.noble
      [
        Judge, Minister, Bishop, Princess, Prince, Queen, King
      ]
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
  class Trader < Profession; end
  class Beggar < Profession; end
  class Farmer < Profession; end
  class Constable < Profession; end

  class Noble < Profession
    def self.unique?
      true
    end
  end

  class Judge < Noble; end
  class Minister < Noble; end
  class Bishop < Noble; end
  class Princess < Noble; end
  class Prince < Noble; end
  class Queen < Noble; end

  class King < Noble
    def conversation_topics
      super + [
        ConversationAboutPolitics.new
      ]
    end
  end

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

  class Monk < Adventurer
    def default_max_hp
      30
    end
  end

  class Paladin < Adventurer
    def default_max_hp
      42
    end
  end

  class Epic < Adventurer; end

  class Necromancer < Epic; end
  class Pyromancer < Epic; end
  class Sage < Epic; end
  class Archmage < Epic; end
  class Ninja < Epic; end
end

module Dragon
  class Profession
    include Dragon::Activities
    include Dragon::Questions

    def type
      self.class.name.split('::').last
    end

    def label; type end

    def questions(*)
      [
        # ...
      ]
    end

    def conversation_topics
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

  class Student < Profession; end
  class Teacher < Profession; end
  class Drunk < Profession; end
  class Barkeep < Profession; end

  class Bard < Profession
    def questions(person)
      qs = if person.activity.is_a?(PlayingMusic)
        [ AskToStop.new(activity: person.activity) ]
      else
        [ AskToStart.new(activity: PlayingMusic.new) ]
      end

      super + qs
    end

    def conversation_topics
      [ Topics::Lore ]
    end
  end

  class Gambler < Profession; end
  class Priest < Profession; end
  class Conscript < Profession; end
  class Jester < Profession; end
  class Scribe < Profession; end
  class Acolyte < Profession; end

  class Sage < Profession
    def conversation_topics
      [ Topics::Lore ]
    end
  end

  class Trader < Profession
    def conversation_topics
      [ Topics::Commerce ]
    end

    def items_for_sale
      Array.new(4) { Item.generate }
    end
  end

  class Beggar < Profession; end
  class Farmer < Profession; end
  class Constable < Profession; end

  class Noble < Profession
    def self.unique?
      true
    end

    def questions(*)
      [ AskForQuests.new ]
    end
  end

  class Judge < Noble; end
  class Minister < Noble; end
  class Bishop < Noble; end
  class Princess < Noble; end
  class Prince < Noble; end
  class Queen < Noble; end

  class King < Noble
    def questions(*args)
      super(*args) + [ AskAboutPolitics.new ]
    end

    # def conversation_topics
    #   super + [
    #     ConversationAboutPolitics.new
    #   ]
    # end
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


  class Necromancer < Wizard; end
  class Pyromancer < Wizard; end
  class Archmage < Wizard; end

  class Ninja < Rogue; end
  class Pirate < Rogue; end
end

module Dragon
  class Profession < Entity
    include CombatAttributes
    include Activities
    include Questions
    include Professions
    include Items
    include Materials

    attr_accessor :person

    def initialize(person)
      @person = person
    end

    def weapon
      person.weapon
    end

    def self.available
      all.reject do |profession|
        profession.unique? && Person.any? do |person|
          person.profession.is_a?(profession)
        end
      end
    end

    def base_range
      0..0 # no bonus by default
    end

    def level
      @level ||= 1
    end

    def upgrade!
      @level += 1
    end

    def xp_for_upgrade
      100 * (level+9) * ((level) ** 2)
    end

    def questions(*)
      []
    end

    def conversation_topics
      []
    end

    def activities
      []
    end

    def default_weapon
      nil
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
        Archmage, Necromancer, Pyromancer, Ninja, Pirate, Spy
      ]
    end
  end
end

module Dragon
  class KillEnemies < Quest
    attr_accessor :count, :species, :tally

    def initialize(requestor: nil, count: nil, species: nil)
      @count   = count
      @species = species

      @tally = 0

      super(requestor: requestor)
    end

    def self.listening_for; [ Dragon::Events::EnemyDiedEvent ] end

    def is_relevant?(event)
      relevant = event.enemy.species == species
      relevant
    end

    def on(event)
      events = []
      @tally += 1
      events.push quest_progressed

      if met_target?
        @completed = true
        events.push quest_completed
      end

      events
    end

    def quest_progressed
      Dragon::Events::QuestProgressedEvent.new(
        quest: self, 
        cause: "You defeated a #{species}")
    end

    def quest_completed
      Dragon::Events::QuestCompletedEvent.new(
        quest: self, 
        cause: "You defeated #{count} #{species}")
    end

    def met_target?
      tally >= count
    end

    def label
      "to defeat #{count} #{species}s"
    end

    def describe
      complete_badge = (completed? ? ' [complete]' : '')
      "defeating #{count} #{species}s #{progress}#{complete_badge} for #{requestor.label}"
    end

    def progress
      "(#{tally}/#{count})"
    end
  end
end

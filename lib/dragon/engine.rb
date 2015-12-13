module Dragon
  class Engine
    include Scenes
    extend Forwardable

    def_delegators :game, :world, :player, :scene, :city, :current_place

    def_delegator :game, :current_place, :place

    def_delegators :terminal, :choose_action, :say
    def_delegators :scene, :actions

    attr_reader :game, :terminal, :last_prompted_actions
    attr_reader :last_command

    attr_accessor :last_events, :last_destination

    def initialize(terminal: nil, game: Game.new)
      @game = game
      @terminal = terminal
      @last_prompted_actions = nil

      @last_events = []
      @last_command = nil
      @last_destination  = nil
    end

    def narrator
      @narrator ||= GameNarrator.new(game, terminal: terminal)
    end

    def interact
      prompt_player
      react(action)
    end

    def prompt_player
      @last_prompted_actions = game.actions(place, last_events)
      terminal.choose_action player: player, actions: @last_prompted_actions
    end

    def react(action)
      @last_command = action
      events = *(action.class.handler(self).handle(action))
      @last_events = process(events.flatten.compact)
      self
    end

    def process(events, sagas: Saga.all)
      events.each do |event|
        addl_events = bus.process_event(event,
                                        sagas: sagas,
                                        player: player)

        if addl_events.any?
          events << addl_events
          events.flatten!.compact!
        end
      end
    end

    def bus
      @bus ||= EventBus.new(engine: self)
    end
  end
end

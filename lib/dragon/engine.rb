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
      @narrator ||= GameNarrator.new(game)
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
      Dragon.log.info "Engine#react action=#{action}"
      
      @last_command = action
      @last_events  = []
      
      bubble_events(action)

      self
    end

    def handle_command(action)
      (action.class.handler(self).handle(action))
    end

    def bubble_events(action)
      event_list = *handle_command(action)
      process_events event_list
      self
    end

    def process_events(event_list, sagas: Saga.all)
      event_list.flatten.compact.each do |event|
        process_event(event, sagas: sagas)
      end
      self
    end

    def process_event(event, sagas: Saga.all)
      Dragon.log.info "Engine#process_event event: #{event}"
      process_events(bus.dispatch(event, sagas: sagas))
      @last_events << event
      self
    end

    def bus
      @bus ||= EventBus.new(engine: self)
    end
  end
end

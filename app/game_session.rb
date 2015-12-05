module Dragon
  class GameSession
    extend Forwardable

    attr_reader :client, :player, :world

    def_delegators :client, :send, :delete
    def_delegators :console, :content, :clear
    def_delegators :engine, :last_prompted_actions, :describe, :prompt_player, :react

    def initialize(world: nil, player: PlayerCharacter.new, client: nil, engine: nil)
      @world  = world
      @player = player
      @client = client
      @engine = engine

      @first_time = true
    end

    def make_character
      clear
      PlayerBuilder.construct PlayerCharacter, console: console
      send output if output
      self
    end

    def step!(data=nil)
      clear
      process_event(data) if data
      describe deep: @first_time
      prompt_player
      send output if output

      @first_time = false if @first_time

      self
    end

    def first_time?
      @first_time
    end

    protected
    def process_event(data)
      action_record = data.detect do |record|
        record['name'] == 'action'
      end

      profession_present = data.detect do |record|
        record['name'] == 'profession'
      end

      if action_record
        action = action_record['value']
        handle action
      elsif profession_present # assume we're creating a character
        player_attributes = %w[ name profession race subtype age gender ]
        player_attributes.each do |attribute|
          value = extract_attribute_from_record(data, attribute)
          player.send :"#{attribute}=", value
        end
      end
    end

    def extract_attribute_from_record(data, attr)
      data.detect { |r| r['name'] == attr }['value']
    end

    def output
      JSON.dump(content: content.join) if content
    end

    def handle(label)
      actions = last_prompted_actions

      unless actions.nil?
        action  = actions.detect do |act|
          act.label == label
        end

        react(action) if action
      end

      self
    end

    private
    def console
      @console ||= StreamingVirtualConsole.new(self)
    end

    def terminal
      @terminal ||= GameTerminal.new(console)
    end

    def engine
      @engine ||= Engine.new(terminal: terminal, player: player, world: world)
    end
  end
end

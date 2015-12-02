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
    end

    def make_character
      clear
      PlayerCharacter.build(console)
      send output
      self
    end

    def step!(data=nil)
      puts "===> GameSession#step!"

      clear
      process_event(data) if data
      describe # deep: false
      prompt_player
      send output

      self
    end

    protected
    def process_event(data)
      puts "---> processing event..."
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
        %w[ name profession race subtype age gender ].each do |attribute|
          value = extract_attribute_from_record(data, attribute)
          puts "---> setting #{attribute} to #{value}"
          player.send :"#{attribute}=", value
        end
      end
    end

    def extract_attribute_from_record(data, attr)
      puts "---> extracting #{attr} from #{data}"
      data.detect { |r| r['name'] == attr }['value']
    end

    def output
      JSON.dump(content: content.join)
    end
  
    def handle(label)
      puts "GameSession#handle label=#{label}"
      actions = last_prompted_actions
      if actions.nil?
        puts "No last actions!"
      else
        puts "---> Attempting to find action..."
        action  = actions.detect do |act|
          act.label == label
        end

        puts "GameSession#handle react action=#{action}"
        react(action) if action
      end

      self
    end

    private
    def console
      @console ||= VirtualConsole.new
    end 

    def terminal
      @terminal ||= GameTerminal.new(console)
    end

    def engine
      @engine ||= Engine.new(terminal: terminal, player: player, world: world)
    end
  end
end

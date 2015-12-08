module Dragon
  class GameSession
    extend Forwardable

    attr_reader :client, :player, :world

    def_delegators :client, :send, :delete
    def_delegators :console, :content, :clear

    def_delegators :engine,
      :last_prompted_actions, :describe, :prompt_player, :react, :player

    def initialize(world: nil, client: nil, engine: nil)
      @world  = world
      @client = client
      @engine = engine

      @first_time = true
    end

    def step!(data=nil)
      clear

      if data
        action_label = process_event(data) 
        handle(action_label) if action_label
      end

      describe
      prompt_player
      send output if output

      @first_time = false if @first_time
      @params = {} # clear out params...

      self
    end

    def handle(label)
      actions = last_prompted_actions

      unless actions.nil?
        action  = actions.detect do |act|
          act.label == label
        end

        augment(action) if params
        react(action) if action
      end

      self
    end

    protected
    def params
      @params ||= {}
    end

    def whitelist
      %w[ name race subtype age gender profession ]
    end

    def augment(command)
      whitelist.each do |attribute|
        if params.has_key?(attribute)
          value = params[attribute]
          puts "---> Augmenting command with #{attribute} == #{value}"
          begin
            command.send :"#{attribute}=", value
          rescue NameError
            # ignore..
            puts "[warning] attempting to augment command #{command.class.name} with #{attribute}"
          end
        end
      end
      puts "===> After augmentation..."
      p [:command, command]
    end

    def data_has_whitelisted_keys?(data)
      whitelist.any? do |key|
        data.detect do |record|
          record['name'] == key
        end
      end
    end

    def process_event(data)
      if data_has_whitelisted_keys?(data)
        whitelist.each do |attribute|
          value = extract_attribute_from_record(data, attribute)
          params[attribute] = value
        end
      end

      profession_record = data.detect do |record|
        record['name'] == 'profession'
      end

      if profession_record # go ahead and dereference the value here
        player_class = Profession.adventuring.detect do |p|
          p.new.type == profession_record['value']
        end

        params['profession'] = player_class.new
      end

      action_record = data.detect do |record|
        record['name'] == 'action'
      end

      if action_record
        action = action_record['value']
        return action
      end
    end

    def extract_attribute_from_record(data, attr)
      data.detect { |r| r['name'] == attr }['value']
    end

    def output
      JSON.dump(content: content.join + "</div>") if content
    end


    private
    def console
      @console ||= StreamingVirtualConsole.new(self)
    end

    def terminal
      @terminal ||= GameTerminal.new(console)
    end

    def engine
      @engine ||= Engine.new(terminal: terminal, world: world)
    end

    def first_time?
      @first_time
    end
  end
end

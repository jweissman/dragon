require 'forwardable'
require 'dragon/version'

module Dragon
  class Town < Struct.new(:name, :type, :subtype)
    def describe
      "#{name}, #{type} town of #{subtype}"
    end
  end

  class World < Struct.new(:name, :type, :subtype, :wonder)
    def describe
      "#{name}, #{subtype} #{type} of #{wonder}"
    end
  end

  class PlayerCharacter < Struct.new(:name, :type, :subtype, :age, :gender, :action)
    TYPES = %w[ warrior wizard soldier rogue ]
  end

  class Console
    def say(msg, heading: false, newline: true, important: false)
      message = "#{!important ? '   ' : '(*) '}#{msg}"
      operation = newline ? :puts : :print
      if heading
        send operation, "  ----->#{message}"
      else
        send operation, "        #{message}"
      end
      self
    end

    def ask(attribute, of: nil, prompt: "Enter #{attribute}: ")
      say prompt, heading: true, newline: false
      of.send :"#{attribute}=", gets.chomp
    end

    def choose(attribute, of: nil, prompt: "Select #{attribute}: ", choices: nil)
      valid_choice, choice_index = false, nil

      until valid_choice
        valid_choice, choice_index = prompt_for_choice(prompt, choices)
      end

      selection = choices[choice_index-1]
      of.send :"#{attribute}=", selection
    end

    protected
    def prompt_for_choice(prompt, choices)
      say prompt, heading: true
      
      choices.each_with_index do |choice, index| 
        say "(#{index+1}) #{choice}"
      end

      choice_index = gets.chomp.to_i
      valid_choice = choice_index > 0 && choice_index <= choices.count
      [valid_choice, choice_index]
    end
  end

  class GameTerminal < Console
    def banner
      say BANNER 
      self
    end

    def welcome(player)
      say "Thanks for playing Dragon, #{player.name} the #{player.type}!"
      self
    end
  end

  BANNER = "<<< DRAGON v#{Dragon::VERSION} >>>"
  PLAYER_NAME_PROMPT = "What is thy name, wanderer? "
  PLAYER_TYPE_PROMPT = "What sort of adventurer are you?"
  PLAYER_ACTION_PROMPT = "What would you like to do?"

  class Game
    extend Forwardable
    def_delegators :console, :say, :ask, :choose, :banner, :welcome

    def play
      say "Let's get started!", heading: true

      banner
      create_character

      while still_playing?
        describe_world
        describe_town
        choose_action
        handle player.action
      end

      say 'Thanks for playing!', heading: true

      self
    end

    def choose_action
      choose :action, of: player, 
        prompt: PLAYER_ACTION_PROMPT, 
        choices: available_actions
    end

    def handle(action)
      if action == :gather_rumours
        say 'There are no rumors to gather!'
      elsif action == :chew_bubble_gum
        say 'There is not even bubble gum!'
      else
        say 'Hmm, it did not seem to work!'
      end
    end

    def create_character
      ask_name
      ask :age, of: player
      ask :gender, of: player

      ask_type

      welcome player

      self
    end

    protected

    def ask_name
      ask :name, of: player, prompt: PLAYER_NAME_PROMPT
      self
    end

    def ask_type
      choose :type, of: player, 
        prompt: PLAYER_TYPE_PROMPT,
        choices: character_types
      self
    end
    
    def describe_world
      say "You are in the world of #{world.describe}."
      self
    end

    def describe_town
      say "The town you are in is #{town.describe}."
      self
    end

    private

    def world
      @world ||= World.new "Heraldia", 'Plane', 'Fateful', 'Dreams'
    end

    def player
      @player ||= PlayerCharacter.new
    end

    def town
      @town ||= Town.new 'Ur', 'Imperial', 'Secret Police'
    end

    def console
      @console ||= GameTerminal.new
    end
 
    def character_types
      PlayerCharacter::TYPES
    end

    def available_actions
      [ :chew_bubble_gum, :gather_rumours, :shake_it, :quit ]
    end

    def still_playing?
      player.action != :quit
    end
   
    def self.play!
      new.play
    end
  end
end

require 'forwardable'

require 'dragon/version'

require 'dragon/town'
require 'dragon/world'

require 'dragon/player_character'
require 'dragon/player_builder'

require 'dragon/console'
require 'dragon/game_terminal'

require 'dragon/game'

module Dragon
  BANNER = "~~~~~~~<<< DRAGON v#{Dragon::VERSION} >>>~~~~~~~~\n\n"
  PLAYER_NAME_PROMPT = "What is thy name, wanderer? "
  PLAYER_RACE_PROMPT = 'Who are your people? '
  PLAYER_TYPE_PROMPT = "What sort of adventurer are you?"
  PLAYER_SUBTYPE_PROMPT = "What are your people like?"
  PLAYER_ACTION_PROMPT = "What would you like to do?"

  def self.play!
    game.boot!
  end

  def self.game
    @game ||= Game.new
  end
end

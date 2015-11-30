require 'pry'
require 'forwardable'

require 'dragon/version'

require 'dragon/entity'

require 'dragon/place'
require 'dragon/area'
require 'dragon/room'
require 'dragon/building'

require 'dragon/town'
require 'dragon/world'

require 'dragon/person'

require 'dragon/player_character'
require 'dragon/player_builder'

require 'dragon/console'
require 'dragon/game_terminal'

require 'dragon/scene'
require 'dragon/exploration'
require 'dragon/conversation'

require 'dragon/engine'
require 'dragon/game'

module Dragon
  BANNER = "\n             ~~~~~~~<<< DRAGON v#{Dragon::VERSION} >>>~~~~~~~~\n\n"

  PLAYER_NAME_PROMPT    = "What is thy name, wanderer? "
  PLAYER_RACE_PROMPT    = 'Who are your people? '
  PLAYER_TYPE_PROMPT    = "What sort of adventurer are you?"
  PLAYER_SUBTYPE_PROMPT = "What are your people like?"
  PLAYER_ACTION_PROMPT  = "What would you like to do?"

  def self.play!
    game.boot!
  end

  def self.game
    @game ||= Game.new
  end
end

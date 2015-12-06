require 'pry' if ENV['TEST'] == '1'

require 'require_all'
require 'forwardable'

require 'dragon/version'

require 'dragon/entity'
require 'dragon/name'

require 'dragon/place'
require 'dragon/area'
require 'dragon/room'

require 'dragon/building'
require_all 'lib/dragon/buildings'

require 'dragon/item'

require 'dragon/city'
require 'dragon/world'

require 'dragon/combatant'

require 'dragon/profession'
require 'dragon/person'
require 'dragon/enemy'

require 'dragon/player_character'
require 'dragon/player_builder'

require 'dragon/console'
require 'dragon/game_terminal'

require 'dragon/conversation_topic'
require_all 'lib/dragon/conversation_topics'

require 'dragon/event'
require_all 'lib/dragon/events'

require 'dragon/event_listener'
require_all 'lib/dragon/listeners'

require 'dragon/command_handler'
require_all 'lib/dragon/handlers'

require 'dragon/command'
require_all 'lib/dragon/commands'

require 'dragon/scene'
require_all 'lib/dragon/scenes'

require 'dragon/narrator'
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

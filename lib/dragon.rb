def under_test?
  ENV['TEST'] == '1'
end

require 'pry' if under_test?

require 'require_all'
require 'forwardable'

require 'dragon/version'
require 'dragon/modules'

require 'dragon/narrator'
require_all 'lib/dragon/narration'

require 'dragon/random'

require 'dragon/entity'
require 'dragon/name'

require 'dragon/place'
require 'dragon/area'
require 'dragon/room'

require 'dragon/building'
require_all 'lib/dragon/buildings'

require 'dragon/item'

require 'dragon/city'
require_all 'lib/dragon/cities'

require 'dragon/world'

require 'dragon/attack_result'
require 'dragon/combatant'

require 'dragon/question'
require_all 'lib/dragon/questions'

require 'dragon/conversation_topic'
require_all 'lib/dragon/topics'

require 'dragon/activity'

require 'dragon/profession'
require_all 'lib/dragon/professions'

require 'dragon/person'
require 'dragon/enemy'

require 'dragon/player_character'
require 'dragon/player_builder'


require 'dragon/console'
require 'dragon/game_terminal'

require 'dragon/event'
require_all 'lib/dragon/events'

require 'dragon/event_listener'
require_all 'lib/dragon/listeners'

require 'dragon/saga'
require 'dragon/quest'
require_all 'lib/dragon/quests'

require 'dragon/event_bus'

require 'dragon/command_handler'
require_all 'lib/dragon/handlers'

require 'dragon/command'
require_all 'lib/dragon/commands'

require 'dragon/scene'
require_all 'lib/dragon/scenes'

require 'dragon/random_event'

require 'dragon/game'
require 'dragon/engine'
require 'dragon/driver'

module Dragon
  BANNER = "\n             ~~~~~~~<<< DRAGON v#{Dragon::VERSION} >>>~~~~~~~~\n\n"

  PLAYER_NAME_PROMPT    = "What is thy name, wanderer? "
  PLAYER_RACE_PROMPT    = 'Who are your people? '
  PLAYER_TYPE_PROMPT    = "What is your job?"
  PLAYER_SUBTYPE_PROMPT = "What are your people like?"
  PLAYER_ACTION_PROMPT  = "What would you like to do?"

  RANDOM_ENCOUNTER_RATE = 0.28
end

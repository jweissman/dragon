def under_test?
  ENV['TEST'] == '1'
end

require 'pry' if under_test?

require 'logger'
require 'require_all'
require 'forwardable'

require 'dragon/version'
require 'dragon/modules'
require_all 'lib/dragon/helpers'

require 'dragon/extend/range'

require 'dragon/narrator'
require_all 'lib/dragon/narration'

require 'dragon/random'

require 'dragon/taggable'
require 'dragon/entity'
require 'dragon/aspect'
require 'dragon/name'

require 'dragon/combat_attributes'

require 'dragon/race'
require 'dragon/subtype'

require 'dragon/place'
require 'dragon/area'
require_all 'lib/dragon/areas'

require 'dragon/room'
require_all 'lib/dragon/rooms'

require 'dragon/building'
require_all 'lib/dragon/buildings'

require 'dragon/material_strength'
require 'dragon/material'
require_all 'lib/dragon/materials'

require 'dragon/quality'
require 'dragon/item'
require_all 'lib/dragon/items'

require 'dragon/city'
require_all 'lib/dragon/cities'

require 'dragon/world'

require 'dragon/attack_result'
require 'dragon/combatant'

require 'dragon/size_class'
require 'dragon/spirit_class'
require 'dragon/intelligence_class'

require 'dragon/creature'

require_all 'lib/dragon/creatures'

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

require 'dragon/command_handler'
require_all 'lib/dragon/handlers'

require 'dragon/command'
require_all 'lib/dragon/commands'

require 'dragon/event'
require_all 'lib/dragon/events'

require 'dragon/event_listener'
require_all 'lib/dragon/listeners'

require 'dragon/saga'
require 'dragon/quest'
require_all 'lib/dragon/quests'

require 'dragon/event_bus'

require 'dragon/scene'
require_all 'lib/dragon/scenes'

require 'dragon/random_event'

require 'dragon/game'
require 'dragon/engine'
require 'dragon/driver'
require 'dragon/support/inspector'

module Dragon
  BANNER = "\n             ~~~~~~~<<< DRAGON v#{VERSION} >>>~~~~~~~~\n\n"

  PLAYER_NAME_PROMPT    = "What is thy name, wanderer? "
  PLAYER_RACE_PROMPT    = 'Who are your people? '
  PLAYER_TYPE_PROMPT    = "What is your job?"
  PLAYER_SUBTYPE_PROMPT = "What are your people like?"
  PLAYER_ACTION_PROMPT  = "What would you like to do?"

  RANDOM_ENCOUNTER_RATE = 0.28

  def self.introspect
    inspector = Support::Inspector.new
    inspector.introspect
  end

  def self.log
    @log ||= Logger.new(log_target)
  end

  def self.log_target
    @log_target ||= under_test? ? 'log/dragon.log' : STDOUT
  end
end

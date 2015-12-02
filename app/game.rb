require 'sinatra'
require 'dragon'
require_all 'app'

$console = VirtualConsole.new
terminal = Dragon::GameTerminal.new($console) 
$game    = Dragon::Engine.new(terminal: terminal)

get '/' do
  $console.clear

  Dragon::PlayerCharacter.build($console)

  @game_content_html = $console.content
  @questions = $console.questions
  @choices =  $console.choices

  slim :index
end

post '/play' do
  "let's go! #{params}"
  # set $game.player data from params
  # $game.describe
  # $game.prompt_player
end

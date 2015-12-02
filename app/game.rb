require 'slim'
require 'sinatra'
require 'dragon'
require_all 'app'

$console = VirtualConsole.new
$terminal = Dragon::GameTerminal.new($console) 
$player  = Dragon::PlayerCharacter.new
$engine    = Dragon::Engine.new(terminal: $terminal, player: $player)

get '/' do
  $console.clear

  Dragon::PlayerCharacter.build($console)

  @engine_content_html = $console.content

  slim :index
end

post '/create-character' do
  params.each do |key,val|
    $player.send("#{key}=",val)
  end

  $console.clear
  $engine.describe
  $engine.prompt_player

  @engine_content_html = $console.content

  slim :play
end

post '/play' do
  $console.clear

  if params['action']
    label   = params['action']
    actions = $engine.last_prompted_actions
    unless actions.nil?
      action  = actions.detect do |act| 
        act.label == label 
      end

      $engine.react(action) if action
    end
  end

  $engine.describe
  $engine.prompt_player

  @engine_content_html = $console.content

  slim :play
end

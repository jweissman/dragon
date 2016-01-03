require 'json'
require 'tilt/erb'
require 'slim'
require 'sinatra'
require 'dragon'

require_all 'app'

module Dragon
  class PlayerDecorator
    extend Forwardable

    def_delegators :player, :score, :level, :name, :race, :subtype, :profession, :gold, :xp
    def_delegators :engine, :place

    attr_reader :player, :engine
    def initialize(player: nil, engine: nil)
      @player = player
      @engine = engine
    end
  end

  class Webapp < Sinatra::Base
    get '/' do
      @page = 'index'
      slim :index
    end

    get '/play' do
      @page = 'play'
      slim :play
    end

    get '/leaderboard' do
      @page = 'leaderboard'
      @players = players.sort_by(&:score).reverse
      slim :leaders
    end

    get "/assets/js/application.js" do
      content_type :js
      @scheme = ENV['RACK_ENV'] == "production" ? "wss://" : "ws://"
      erb :"application.js"
    end

    protected
    def players
      engines.map do |engine|
        PlayerDecorator.new(player: engine.player, engine: engine)
        # (&:player)
      end
    end

    def engines
      sessions.map(&:engine)
    end

    def sessions
      GameSession.all
    end
  end
end

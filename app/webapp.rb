require 'json'
require 'tilt/erb'
require 'slim'
require 'sinatra'
require 'dragon'

require_all 'app'

module Dragon
  class Webapp < Sinatra::Base
    get '/' do
      @page = 'index'
      slim :index
    end

    get '/play' do
      @page = 'play'
      slim :play
    end

   get "/assets/js/application.js" do
      content_type :js
      @scheme = ENV['RACK_ENV'] == "production" ? "wss://" : "ws://"
      erb :"application.js"
    end
  end
end

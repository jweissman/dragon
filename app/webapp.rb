require 'json'
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
  end
end

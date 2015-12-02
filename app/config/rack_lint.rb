# disable rack::lint
module Rack
  class Lint
    def call(env = nil)
      @app.call(env)
    end
  end
end 

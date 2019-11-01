require_relative 'config/environment'
require_relative 'models/book'
require_relative 'routes'
require 'json'

class Server
  def call(env)
    handler = routes(env)
    handler.call if handler
  end
end

require_relative 'config/environment'
require_relative 'models/book'
require_relative 'routes'
require 'json'

class Server
  def call(env)
    Routes.new(env).handler.call
  end
end

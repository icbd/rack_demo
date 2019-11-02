# frozen_string_literal: true

require_relative 'config/environment'
require_relative 'models/book'
require_relative 'server'
require_relative 'middlewares/rack_logger'

use RackLogger
run Server.new

# # `$ rackup -p 3000` 等效于以 Ruby 脚本的形式运行以下脚本:
# require 'rack'
#
# Rack::Handler::WEBrick.run RackLogger.new(Server.new), Port: 3000

# frozen_string_literal: true

require_relative 'config/environment'
require_relative 'models/book'
require_relative 'server'
require_relative 'middlewares/rack_logger'
require_relative 'middlewares/json_view'

use RackLogger
use JsonView

run Server.new

# # `$ rackup -p 3000` 等效于以 Ruby 脚本的形式运行以下脚本:
# require 'rack'
#
# Rack::Handler::WEBrick.run \
#   JsonView.new(RackLogger.new(Server.new)), Port: 3000

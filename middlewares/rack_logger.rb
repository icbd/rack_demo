# frozen_string_literal: true

require 'logger'

class RackLogger
  attr_reader :server, :logger

  def initialize(server)
    @server = server
    @logger = Logger.new(File.expand_path('../log/rack.log', __dir__), datetime_format: '%Y-%m-%d %H:%M:%S')
  end

  def call(env)
    logger.info "REQUEST: #{env['REQUEST_METHOD']}  #{env['REQUEST_URI']}"

    status, head, body = server.call(env)

    logger.info "RESPONSE: #{status}  #{body}"

    [status, head, body]
  end
end

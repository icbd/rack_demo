# frozen_string_literal: true

require 'erb'

class JsonView
  attr_reader :server
  attr_reader :env
  attr_reader :status, :head, :body

  def initialize(server)
    @server = server
  end

  def call(env)
    @env = env
    @status, @head, @body = server.call(env)
    render_html if status == 200 && browser?

    [status, head, body]
  end

  private

  def browser?
    env['HTTP_USER_AGENT'].include?('Mozilla')
  end

  def render_html
    @head = { 'Content-Type' => 'text/html' }
    template = ERB.new \
      File.read(File.expand_path('../views/json-view.html.erb', __dir__))
    variables = { json_data: body }
    html = template.result_with_hash variables
    @body = [html]
  end
end

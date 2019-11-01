# frozen_string_literal: true

class BaseController
  attr_reader :params

  def initialize(params = {})
    @params = params
  end

  def routing_error
    [404, { 'Content-Type' => 'text/html' }, ['Routing Error']]
  end
end

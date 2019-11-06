# frozen_string_literal: true

require_relative 'controllers/books_controller'

class Routes
  attr_reader :env

  def initialize(env)
    @env = env
  end

  def handler
    case env['PATH_INFO']
    when %r{\/books\/(\w+)}
      params = { isbn: Regexp.last_match[1] }
      BooksController.new(params).method(:show)
    when %r{\/books}
      BooksController.new.method(:index)
    else
      BaseController.new.method(:routing_error)
    end
  end
end

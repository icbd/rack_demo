require_relative 'controllers/books_controller'

class Routes
  attr_reader :env

  def initialize(env)
    @env = env
  end

  def handler
    case env["REQUEST_PATH"]
    when /\/books\/(\w+)/
      params = { isbn: $1 }
      BooksController.new(params).method(:show)
    when /\/books/
      BooksController.new.method(:index)
    else
      BaseController.new.method(:routing_error)
    end
  end
end

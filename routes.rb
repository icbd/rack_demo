require_relative 'controllers/books_controller'

def routes(env)
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

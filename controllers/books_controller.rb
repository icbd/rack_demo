# frozen_string_literal: true

require_relative 'base_controller'

class BooksController < BaseController
  def index
    books = Book.all.order(id: :asc)
    [200, { 'Content-Type' => 'application/json' }, [books.to_json]]
  end

  def show
    book = Book.find_by!(isbn: params[:isbn])
    [200, { 'Content-Type' => 'application/json' }, [book.to_json]]
  rescue ActiveRecord::RecordNotFound
    [404, { 'Content-Type' => 'text/html' }, ['Not Found']]
  end
end

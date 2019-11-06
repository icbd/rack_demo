# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe 'Books', type: :request do
  include Rack::Test::Methods

  let(:app) { Server.new }

  it 'GET /books' do
    get '/books'

    expect(last_response.status).to eq 200
    expect(last_response.body).to eq Book.all.order(:id).to_json
  end

  it 'GET /books/{ISBN}' do
    book = Book.last

    get "/books/#{book.isbn}"

    expect(last_response.status).to eq 200
    expect(last_response.body).to eq book.to_json
  end

  it 'GET /error_routes' do
    get 'error_routes'

    expect(last_response.status).to eq 404
    expect(last_response.body).to eq 'Routing Error'
  end
end

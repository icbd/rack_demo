# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe 'Books', type: :request do
  let(:server) { Server.new }

  it 'GET /books' do
    env = { 'REQUEST_METHOD' => 'GET', 'REQUEST_PATH' => '/books' }
    response = server.call(env)

    expect(response[0]).to eq 200
    expect(response[2][0]).to eq Book.all.order(:id).to_json
  end

  it 'GET /books/{ISBN}' do
    book = Book.last

    env = { 'REQUEST_METHOD' => 'GET', 'REQUEST_PATH' => "/books/#{book.isbn}" }
    response = server.call(env)

    expect(response[0]).to eq 200
    expect(response[2][0]).to eq book.to_json
  end

  it 'GET /error_routes' do
    env = { 'REQUEST_METHOD' => 'GET', 'REQUEST_PATH' => '/error_routes' }
    response = server.call(env)

    expect(response[0]).to eq 404
    expect(response[2][0]).to eq 'Routing Error'
  end
end

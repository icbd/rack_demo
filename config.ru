# frozen_string_literal: true

require_relative 'config/environment'
require_relative 'models/book'
require_relative 'server'

run Server.new

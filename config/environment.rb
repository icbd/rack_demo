require 'bundler/setup'
require 'active_record'
require 'sqlite3'
require 'pry'

require_relative '../config/environment'

database_config = YAML::load(File.open('config/database.yml'))
ActiveRecord::Base.establish_connection(database_config)

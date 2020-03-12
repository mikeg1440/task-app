ENV['SINATRA_ENV'] ||= "development"


require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

# require 'date'
require 'time'
require 'rack-flash'
require 'dotenv'

Dotenv.load

require './app/controllers/application_controller'
require_all 'app'

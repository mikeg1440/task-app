ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'


desc 'Console for testing'
task :console do
  Pry.start
end

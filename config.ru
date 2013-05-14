require 'rubygems'
require 'bundler'

Bundler.setup
Bundler.require

IsItOpenCoffeeTomorrow::Application.configure do |app|
  app.set :hash_tag, "#BOCC"
  #app.set :seed, DateTime.new(2011, 03, 15)
  app.set :seed, DateTime.new(2013, 05, 01)
  app.set :time_zone, "Mountain Time (US & Canada)"
  app.set :official_site, "http://boulderopencoffeeclub.com"
  app.set :ga_token, 'UA-22550563-1'
  app.set :skip_dates, %w(2013-01-01)
end

run IsItOpenCoffeeTomorrow::Application

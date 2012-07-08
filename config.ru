require 'rubygems'
require 'bundler'

Bundler.setup
Bundler.require

IsItOpenCoffeeTomorrow::Application.configure do |app|
  app.set :hash_tag, "#BOCC"
  app.set :seed, DateTime.new(2011, 03, 15)
  app.set :time_zone, "Mountain Time (US & Canada)"
  app.set :official_site, "http://boulderopencoffeeclub.com"
end

run IsItOpenCoffeeTomorrow::Application

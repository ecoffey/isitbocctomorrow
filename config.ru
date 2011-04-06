path = File.expand_path "../", __FILE__

require "#{path}/app"

use Rack::Static, :urls => ["/css", "/js", "/images"], :root => "public"

if ENV['RACK_ENV'] != 'production'
  require 'sass/plugin/rack'
  use Sass::Plugin::Rack

  Sass::Plugin.options[:css_location] = './public/css'
  Sass::Plugin.options[:template_location] = './sass'
end

run IsItBoccTomorrow::Application

path = File.expand_path "../", __FILE__

require "#{path}/app"

use Rack::Static, :urls => ["/css", "/js", "/images"], :root => "public"

run IsItBoccTomorrow::Application

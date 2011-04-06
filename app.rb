require 'sinatra/base'
require 'haml'
require 'active_support/time'

module IsItBoccTomorrow
  class Application < Sinatra::Base
    seed = DateTime.new(2011, 03, 29)
    enable :run

    get '/' do
      now = Time.now.utc.in_time_zone("Mountain Time (US & Canada)").to_date

      days = (now - seed).to_i + 1

      @is_bocc_tomorrow = days % 14 == 0 ? "yes" : "no"

      haml :index
    end
  end
end

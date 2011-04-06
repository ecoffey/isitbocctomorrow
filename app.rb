require 'sinatra/base'
require 'haml'
require 'active_support/time'

module IsItBoccTomorrow
  class Application < Sinatra::Base
    enable :run

    seed = DateTime.new(2011, 03, 29)

    get '/' do
      tomorrow = Time.now.tomorrow.utc.in_time_zone("Mountain Time (US & Canada)").to_date

      diff_days = (tomorrow - seed).to_i

      @is_bocc_tomorrow = diff_days % 14 == 0 ? "yes" : "no"

      haml :index
    end
  end
end

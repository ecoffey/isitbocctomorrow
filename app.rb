require 'sinatra/base'
require 'haml'
require 'active_support/time'
require 'active_support/inflector'

module IsItBoccTomorrow
  class Application < Sinatra::Base
    enable :run

    seed = DateTime.new(2011, 03, 15)

    get '/' do
      now = Time.now.utc.in_time_zone("Mountain Time (US & Canada)").to_date
      tomorrow = now.tomorrow.to_date

      diff_days_now = (now - seed).to_i % 14
      diff_days_tomorrow = (tomorrow - seed).to_i % 14

      last_bocc = now - diff_days_now
      next_bocc = last_bocc.advance(:days => 14)

      days_till_next_bocc = (next_bocc - now).to_i
      @days_till_next_bocc =
        days_till_next_bocc > 1 ? "#{days_till_next_bocc} days" : "#{days_till_next_bocc} day"

      @last_bocc = last_bocc.to_formatted_s(:long_ordinal)
      @next_bocc = next_bocc.to_formatted_s(:long_ordinal)
      @is_bocc_tomorrow = diff_days_tomorrow == 0 ? "yes" : "no"

      haml :index
    end
  end
end

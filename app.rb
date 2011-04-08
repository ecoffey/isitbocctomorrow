require 'mongo'
require 'sinatra/base'
require 'haml'
require 'active_support/time'

module IsItBoccTomorrow
  class Application < Sinatra::Base
    enable :run

    seed = DateTime.new(2011, 03, 15)

    get '/' do
      log_request
      now = Time.now.utc.in_time_zone("Mountain Time (US & Canada)")
      tomorrow = now.tomorrow.to_date

      @diff_days = (tomorrow - seed).to_i % 14

      last_bocc = tomorrow - @diff_days
      next_bocc = last_bocc.advance(:days => 14)

      @days_till_next_bocc = (next_bocc - tomorrow).to_i + 1

      @last_bocc = last_bocc.to_formatted_s(:long_ordinal)
      @next_bocc = next_bocc.to_formatted_s(:long_ordinal)
      @is_bocc_tomorrow = @diff_days == 0 ? "yes" : "no"

      seconds_till_midnight = (tomorrow.midnight.advance(:minutes => 5) - now).to_i

      response.headers['Cache-Control'] = "max-age=#{seconds_till_midnight}, must-revalidate"

      haml :index
    end

    private
      def log_request
        db = Mongo::Connection.new('flame.mongohq.com', 27097).db('isitbocctomorrow')
        db.authenticate('db_user', 'mun2ster')

        db[ENV['RACK_ENV']].insert({'time' => Time.now.ctime})
      end
  end
end

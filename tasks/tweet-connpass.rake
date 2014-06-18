require 'rake'
require 'net/http'
require 'json'
require 'time'

require './tasks/tweet.rb'

NIIGATARB_MEETUP_ID = 775
CONNPASS_API = 'http://connpass.com/api/v1/event/'

namespace :tweet do
    desc 'Tweet meetup'
    task :meetup  do
        url = CONNPASS_API + "?series_id=#{NIIGATARB_MEETUP_ID}&count=1"
        meetup = JSON.parse( Net::HTTP.get URI(url) )
        if meetup && meetup['events'] && event = meetup['events'].first
            now = Time.new - 100000000000
            started_at = Time.parse event['started_at']
            ended_at = Time.parse event['ended_at']

            if started_at > now
                date = started_at.to_date
                tweet "次回のNiigara.rb meetup は #{date.mon}/#{date.day} 開催です"
            elsif ended_at < now
                # past
            else
                # now
            end
        end
    end
end


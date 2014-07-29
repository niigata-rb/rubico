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
            now = Time.new
            started_at = Time.parse event['started_at']
            ended_at = Time.parse event['ended_at']

            if started_at >= now
								today = now.to_date
                date = started_at.to_date
								case date.day
								when today.day then msg = "本日 Niigara.rb meetup 開催です!"
								when today.day + 1 then msg = "次回 Niigara.rb meetup は明日開催です"
								else
									msg = "次回のNiigara.rb meetup は #{date.mon}/#{date.day} 開催です"
								end
								tweet msg
                
            elsif ended_at < now
                # past
            end
        end
    end
end


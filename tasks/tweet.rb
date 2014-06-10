require 'twitter_oauth'

CLIENT = TwitterOAuth::Client.new(
    :consumer_key    => ENV['CONSUMER_KEY'],
    :consumer_secret => ENV['CONSUMER_SECRET'],
    :token           => ENV['ACCESS_TOKEN'],
    :secret          => ENV['ACCESS_TOKEN_SECRET']
)

def tweet(msg)
	print "POST #{msg}... "
	if CLIENT.authorized?
		CLIENT.update msg
		puts 'done'
	else
		puts 'not authorzied'
	end
end

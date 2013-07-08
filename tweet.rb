require 'twitter_oauth'
msg = ENV[ARGV[0]]

client = TwitterOAuth::Client.new(
    :consumer_key => ENV['CONSUMER_KEY'],
    :consumer_secret => ENV['CONSUMER_SECRET'],
    :token => ENV['ACCESS_TOKEN'],
    :secret => ENV['ACCESS_TOKEN_SECRET']
)

print "POST #{ARGV[0]}... "
if client.authorized?
  client.update msg
  puts 'done'
else
  puts 'not authorzied'
end

require 'twitter_oauth'
msg = ENV['MESSAGE']

puts "TASK", msg

client = TwitterOAuth::Client.new(
    :consumer_key => ENV['CONSUMER_KEY'],
    :consumer_secret => ENV['CONSUMER_SECRET'],
    :token => ENV['ACCESS_TOKEN'],
    :secret => ENV['ACCESS_TOKEN_SECRET']
)
p client
if client.authorized?
  puts 'POST!!!!!!!!'
  client.update msg
else
  puts 'not authorzied'
end

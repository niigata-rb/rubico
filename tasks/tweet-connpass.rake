require 'rake'
require './tweet.rb'

namespace :tweet do
	desc "Tweet meetup"
	task :meetup => :environment do
		tweet("test")
	end
end


require 'resolv-replace.rb'
require 'rufus/scheduler'

s = Rufus::Scheduler.new

s.cron '30 02 * * *' do	
	clowder = Cat.search_for_cats

	clowder.each do |bobcat|
		Cat.create(thumb_image_of_the_cat: bobcat)
	end
end


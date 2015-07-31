require 'rufus/scheduler'

s = Rufus::Scheduler.new

s.cron '30 02 * * *' do	
	Cat.search_for_cats
end

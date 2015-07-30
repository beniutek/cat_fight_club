# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

bobcats = Cat.search_for_cats

bobcats.each do |tomcat|
	Cat.create(cuteness_score: 0, thumb_image_of_the_cat: tomcat, uploaded_at: Time.now)
end
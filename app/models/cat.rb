class Cat < ActiveRecord::Base
	extend CatHunter
	has_many :votes, dependent: :delete_all
	validates :thumb_image_of_the_cat, uniqueness: true 

	def self.top_cats(limit = 10, date = "2000-01-01")
		Cat.where(id: get_cats(limit,date)).order(cuteness_score: :desc)
	end

	def self.get_cats(limit = 10, date = "2000-01-01")
		#Vote.select(:cat_id).according_to_date(date).group(:cat_id).limit(limit).count.keys
		Vote.according_to_date(date).group(:cat_id).limit(limit).count.keys
	end

	def self.get_random_cats(limit = 2)
		Cat.where(id: Cat.ids.sort_by {rand}.slice(0,limit))
	end
end
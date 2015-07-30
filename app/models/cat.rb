class Cat < ActiveRecord::Base
	scope :top_cats, ->(limit = 10, time = Time.beginning_of_day) { where("uploaded_at >= ?",time).order(cuteness_score: :desc).limit limit }
	scope :top_cats_all_time, ->(limit = 10) { order(cuteness_score: :desc).limit limit }
end

class Vote < ActiveRecord::Base
	belongs_to :cat, counter_cache: :cuteness_score

	scope :according_to_date, ->(date = "2000-01-01") { where("created_at >=?",date) }

end

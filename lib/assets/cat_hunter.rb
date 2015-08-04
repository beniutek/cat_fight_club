module CatHunter
	FlickRaw.api_key = Rails.application.secrets.flickr_api_key
	FlickRaw.shared_secret = Rails.application.secrets.flickr_shared_secrets
	def search_for_cats(kitty = "cat")
		kitties = flickr.photos.search(text: kitty, media: 'photos')
		kitties.to_a.map! { |kitty|
			kitty = FlickRaw.url_b(kitty)
			Cat.create(thumb_image_of_the_cat: kitty)
		}
	end
end
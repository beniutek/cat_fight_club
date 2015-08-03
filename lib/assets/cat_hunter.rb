module CatHunter

    FlickRaw.api_key = '4b49ab63851847558de3ce7ca95af33b'
	FlickRaw.shared_secret = 'f7df029ae31480eb'


	# FlickRaw.api_key = Rails.application.secrets.flickr_api_key
	# FlickRaw.shared_secret = Rails.application.secrets.flickr_shared_secrets
	def search_for_cats(kitty = "cat")
		kitties = flickr.photos.search(text: kitty, media: 'photos')
		tmp = []
		kitties.to_a.map! { |pussy|
			pussy = FlickRaw.url_b(pussy)
			Cat.create(thumb_image_of_the_cat: pussy)
		}
	end
end
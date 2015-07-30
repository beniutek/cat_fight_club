module CatHunter
	FlickRaw.api_key = '4b49ab63851847558de3ce7ca95af33b'
	FlickRaw.shared_secret = 'f7df029ae31480eb'

	def search_for_cats(kitty = "cat")
		kitties = flickr.photos.search(text: kitty, media: 'photos')
		kitties.to_a.map! { |pussy|
			pussy = FlickRaw.url_b(pussy)
		}
	end
end
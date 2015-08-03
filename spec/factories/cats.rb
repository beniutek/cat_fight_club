FactoryGirl.define do
  sequence :cuteness_score do |n|
    rand(10*n)+5
  end
end

FactoryGirl.define do
  factory :cat_1 do
    cuteness_score 
    thumb_image_of_the_cat 'https://www.petfinder.com/wp-content/uploads/2012/11/99950237-why-cats-meow-632x475.jpg'
  end

end

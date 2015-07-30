class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.integer :cuteness_score
      t.string :thumb_image_of_the_cat
      t.datetime :uploaded_at
      t.timestamps null: false
    end
  end
end

class AddDefaultToScore < ActiveRecord::Migration
  def change
  	change_column :cats, :cuteness_score, :integer, default: 0
  end
end

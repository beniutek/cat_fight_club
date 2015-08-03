class AddIndexToVotes < ActiveRecord::Migration
  def change
  	add_index :cats, :cuteness_score
  end
end

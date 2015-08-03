class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :cat, index:true
      t.timestamps null: false
    end
    remove_column :cats, :uploaded_at
  end
end

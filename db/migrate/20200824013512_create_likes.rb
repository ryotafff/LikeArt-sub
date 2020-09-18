class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|

    t.integer :user_id
	t.integer :event_id
	t.integer :artwork_id

    t.timestamps
   end
  end
end

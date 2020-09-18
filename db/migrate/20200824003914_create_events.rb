class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|

    t.integer :user_id
	t.string :title
	t.string :artist
	t.string :image_id
	t.text :Introduction
	t.date :start_date
	t.date :end_date
	t.string :place
	t.string :address
	t.text :event_url
	t.integer :price
	t.integer :hold_status , default: 0

      t.timestamps
    end
  end
end

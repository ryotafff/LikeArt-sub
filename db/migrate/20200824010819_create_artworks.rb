class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|

    t.integer :user_id
  	t.string :image_id
  	t.string :title
  	t.string :artist_name
  	t.text :Introduction
  	t.string :tag_list

      t.timestamps
    end
  end
end

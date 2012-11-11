class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :track_name
      t.string :artist_name
      t.date :release_date
      t.string :preview_url
      t.string :jacket_image_url
      t.string :track_view_url

      t.timestamps
    end
  end
end

class Track < ActiveRecord::Base
  attr_accessible :artist_name, :jacket_image_url, :preview_url, :release_date, :track_name, :track_view_url

  def to_hash
    ActiveSupport::JSON.decode(self.to_json)
  end

  def Track.create_from_json(track_json)
    Track.create(
      :artist_name => track_json['artistName'],
      :track_name => track_json['trackName'],
      :track_view_url => track_json['trackViewUrl'],
      :preview_url =>  track_json['previewUrl'],
      :jacket_image_url => track_json['artworkUrl100'],
      :release_date => track_json['releaseDate']
    )
  end
end

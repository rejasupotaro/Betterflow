class Track < ActiveRecord::Base
  attr_accessible :artist_name, :jacket_image_url, :preview_url, :release_date, :track_name, :track_view_url

  def to_hash
    ActiveSupport::JSON.decode(self.to_json)
  end
end

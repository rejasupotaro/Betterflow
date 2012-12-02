require 'net/http'

class ApiController < ApplicationController
  def get_track_list
    json_array = Array.new
    json_array = get_track_list_from_db()
    if json_array.length <= 0
      artist_name = 'lady gaga'
      json_array = get_track_list_from_itunes(artist_name)
    end

    render :json => JSON.generate(json_array)
  end

  def get_track_list_from_itunes(artist_name)
    host = 'itunes.apple.com'
    path = '/search?term=' + CGI::escape(artist_name)

    http = Net::HTTP.new(host, 80)
    req = Net::HTTP::Get.new(path)
    res = http.request(req)
    hash = JSON.parse(res.body)

    track_json_array = Array.new
    if hash['resultCount'] > 0
      track_json_array = hash['results']
      track_json_array.each do |track_json|
        if track_json['artistName'].downcase == artist_name
          save_track_from_json(track_json)
        end
      end 
    else
      p "Oh... Something is wrong......"
    end

    return get_track_list_from_db()
  end

  def get_track_list_from_db
    json_array = Array.new
    track_list = Track.find(:all)
    if track_list.length > 0
      track_list.each do |track|
        json_array.push(track.to_hash)
      end
    end

    return json_array
  end

  def save_track_from_json(track_json)
    track = Track.create(
      :artist_name => track_json['artistName'],
      :track_name => track_json['trackName'],
      :track_view_url => track_json['trackViewUrl'],
      :preview_url =>  track_json['previewUrl'],
      :jacket_image_url => track_json['artworkUrl100'],
      :release_date => track_json['releaseDate']
    )
  end

end

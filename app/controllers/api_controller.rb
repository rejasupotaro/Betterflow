require 'net/http'

class ApiController < ApplicationController
  def get_track_list
    json_array = []

    sample_json1 = {
      "artistName" => "Lady GaGa",
      "trackName" => "Poker Face",
      "trackViewUrl" => "https://itunes.apple.com/us/music-video/poker-face/id294538235?uo=4",
      "previewUrl" =>  "http://a782.v.phobos.apple.com/us/r1000/034/Video/90/65/57/mzm.nmnvboco..640x464.h264lc.u.p.m4v",
      "jacketImageUrl" => "http://a1632.phobos.apple.com/us/r1000/005/Video/de/ae/d3/mzi.wkfmmxrw.100x100-75.jpg",
      "releaseDate" => "2008-10-22T07:00:00Z",
    }

    sample_json2 = {
      "artistName" => "Lady GaGa",
      "trackName" => "The Edge of Glory",
      "trackViewUrl" => "https://itunes.apple.com/us/music-video/the-edge-of-glory/id444524382?uo=4",
      "previewUrl" => "http://a223.v.phobos.apple.com/us/r1000/118/Video/b8/e9/52/mzi.tjdfdqsz..640x256.h264lc.u.p.m4v",
      "artworkUrl" => "http://a370.phobos.apple.com/us/r1000/100/Video/8b/7c/68/mzi.shewzoty.100x100-75.jpg",
      "releaseDate" => "2011-06-17T07:00:00Z",
    }
    
    sample_json3 = {
      "artistName" => "Lady GaGa",
      "trackName" => "Beautiful, Dirty, Rich",
      "trackViewUrl" => "https://itunes.apple.com/us/music-video/beautiful-dirty-rich/id294351882?uo=4",
      "previewUrl" => "http://a273.v.phobos.apple.com/us/r1000/040/Video/d6/dc/7b/mzm.ydwyekmd..640x352.h264lc.u.p.m4v",
      "artworkUrl" => "http://a650.phobos.apple.com/us/r1000/004/Video/0e/07/fe/mzi.olauxiar.100x100-75.jpg",
      "releaseDate" => "2008-10-21T07:00:00Z",
    }

    json_array.push(sample_json1)
    json_array.push(sample_json2)
    json_array.push(sample_json3)

    json_array = get_track_list_from_db()
    if json_array.length <= 0
      artist_name = 'lady gaga'
      json_array = get_track_list_from_itunes(artist_name)
    end

    render :json => json_array
  end

  def get_track_list_by_itunes(artist_name)
    host = 'itunes.apple.com'
    path = '/search?term=' + CGI::escape(artist_name)

    http = Net::HTTP.new(host, 80)
    req = Net::HTTP::Get.new(path)
    res = http.request(req)
    hash = JSON.parse(res.body)
    #json = JSON.generate(hash)

    track_json_array = Array.new
    if hash['resultCount'] > 0
      track_json_array = hash['results']
      track_json_array.each { |track_json|
        if track_json['artistName'].downcase == "downcase"
          save_track_from_json(track_json)
        end
      }
    else
      p "Oh... Something is wrong......"
    end

    return track_json_array
  end

  def get_track_list_from_db
    json_array = Array.new
    tracks = Track.find(:all)
    if tracks.length > 0
      tracks.each { |track|
        json_array.push(track.to_hash)
      }
    end

    return JSON.generate(json_array)
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

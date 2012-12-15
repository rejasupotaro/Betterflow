module ApiHelper
  def get_track_list_from_itunes(artist_name)
    host = 'itunes.apple.com'
    path = '/search?term=' + CGI::escape(artist_name)

    http = Net::HTTP.new(host, 80)
    req = Net::HTTP::Get.new(path)
    res = http.request(req)
    p res
    hash = JSON.parse(res.body)
    p hash

    track_json_array = Array.new
    if hash['resultCount'] > 0
      track_json_array = hash['results']
      track_json_array.each do |track_json|
        if track_json['artistName'].downcase == artist_name
          Track.create_from_json(track_json)
        end
      end
    else
      p "Oh... Something is wrong......"
    end
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
end

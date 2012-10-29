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

    render :json => json_array
  end
end

require 'net/http'

class ApiController < ApplicationController
  include ApiHelper

  def get_track_list
    json_array = Array.new
    json_array = get_track_list_from_db()
    if json_array.length <= 0
      artist_name = 'lady gaga'
      get_track_list_from_itunes(artist_name)
      json_array = get_track_list_from_db()
    end

    render :json => JSON.generate(json_array)
  end
end

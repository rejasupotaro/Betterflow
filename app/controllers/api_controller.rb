require 'net/http'

class ApiController < ApplicationController
  include ApiHelper

  def get_track_list
    json_list = Array.new
    json_list = get_track_list_from_db()
    if json_list.length <= 0
      artist_name = 'lady gaga'
      get_track_list_from_itunes(artist_name)
      json_list = get_track_list_from_db()
    end

    render :json => JSON.generate(json_list)
  end
end

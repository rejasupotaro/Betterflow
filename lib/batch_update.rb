require 'open-uri'
require 'kconv'

class BatchUpdate
  
  SC_OK = "200"

  def self.execute
    update_track
  end

  def self.update_track
    puts("==== " + Time.now.to_s + " ====")

    not_found_id_list = Array.new
    track_list = Track.find(:all, :limit => 2)
    track_list.each do |track|
      p track
      if !exist?(track.preview_url)
        not_found_id_list.push(track.id)
      end
    end

    not_found_id_list.each do |id|
      Track.delete(id)
      assert_raise(ActiveRecord::RecordNotFound) do
        Track.find(id)
      end
    end

    puts("==== update done!!! ====")
  end

  def self.exist?(url)
    result = false

    open(url) do |file|
      status_code = file.status[0]
      p status_code
      if file.status[0] == SC_OK
        result = true
      end
    end

    return result
  end
end


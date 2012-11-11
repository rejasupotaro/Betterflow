gif_list = [
  "/assets/gifs/gaga0.gif"
  "/assets/gifs/gaga1.gif"
  "/assets/gifs/gaga2.gif"
  "/assets/gifs/gaga3.gif"
  "/assets/gifs/gaga4.gif"
  "/assets/gifs/gaga5.gif"
  "/assets/gifs/gaga6.gif"
  "/assets/gifs/gaga7.gif"
  "/assets/gifs/gaga8.gif"
  "/assets/gifs/gaga9.gif"
  "/assets/gifs/gaga10.gif"
  "/assets/gifs/gaga11.gif"
  "/assets/gifs/gaga12.gif"
  "/assets/gifs/gaga13.gif"
  "/assets/gifs/gaga14.gif"
  "/assets/gifs/gaga15.gif"
  "/assets/gifs/gaga16.gif"
  "/assets/gifs/gaga17.gif"
  "/assets/gifs/gaga18.gif"
  "/assets/gifs/gaga19.gif"
  "/assets/gifs/gaga22.gif"
  "/assets/gifs/gaga23.gif"
  "/assets/gifs/gaga24.gif"
  "/assets/gifs/gaga25.gif"
  "/assets/gifs/gaga26.gif"
  "/assets/gifs/gaga27.gif"
  "/assets/gifs/gaga28.gif"
  "/assets/gifs/gaga29.gif"
  "/assets/gifs/gaga30.gif"
  "/assets/gifs/gaga33.gif"
  "/assets/gifs/gaga34.gif"
  "/assets/gifs/gaga35.gif"
]

class Track
  constructor: (track_json = {}) ->
    @artist_name = track_json.artist_name || "----"
    @track_name = track_json.track_name || "----"
    @release_date = track_json.release_date || "----"
    @preview_url = track_json.preview_url || ""
    @jacket_image_url = track_json.jacket_image_url || ""
    @track_view_url = track_json.track_view_url || ""

  get_preview_url: ->
    @preview_url

  get_artist_name: ->
    @artist_name

  get_track_name: ->
    @track_name

  get_release_date: ->
    @release_date.substring(0, 4)

  get_jacket_image_url: ->
    @jacket_image_url

  get_track_view_url: ->
    @track_view_url

get_random = (max) ->
  Math.floor(Math.random() * max)

build_url = (base_url) ->
  "url(" + base_url + ")"

root = exports ? this
root.open_new_tab = (url) ->
  window.open(url)

window.onload = ->
  background_image = $("#gif_bg")[0]
  music_player = $("audio#music_player")[0]
  scratch_player = $("audio#scratch_player")[0]
  track_list = []
  playing_track_index = 0

  set_background_image_random = ->
    background_image.style.backgroundImage = build_url(gif_list[get_random(gif_list.length)])
  set_background_image_random()

  set_track_info = (track) ->
    track_name = track.get_track_name()
    if track_name.length < 14
      $("#track_top_title")[0].innerHTML = track_name
    else
      $("#track_top_title")[0].style.fontSize = "60px"
      $("#track_top_title")[0].innerHTML = track_name

    $("#track_name")[0].innerHTML = track_name

    artist_name = track.get_artist_name()
    $("#artist_name")[0].innerHTML = artist_name

    release_date = track.get_release_date()
    $("#release_date")[0].innerHTML = release_date

    jacket_image_url = track.get_jacket_image_url()
    $("#jacket_image")[0].src = jacket_image_url
    $("#jacket_image")[0].href = track.get_track_view_url()

  play_music = ->
    set_track_info(track_list[playing_track_index])
    music_player.play()
  play_scratch = ->
    set_track_info(new Track())
    background_image.style.backgroundImage = "url(/assets/tv_noise.gif)"
    scratch_player.play()

  music_player.addEventListener("ended", ->
    play_scratch()
    playing_track_index = get_random(track_list.length)
    music_player.src = track_list[playing_track_index].get_preview_url())

  scratch_player.addEventListener("ended", ->
    play_music()
    set_background_image_random())

  on_receive_track_list = (track_json_list) ->
    for i in [0..track_json_list.length]
      track_json = track_json_list[i]
      if track_json?
        track_list[i] = new Track(track_json)

    playing_track_index = get_random(track_list.length)
    music_player.src = track_list[playing_track_index].get_preview_url()
    track = track_list[playing_track_index]

    play_music()

  get_track_list = ->
    $.ajax({
      type: "GET",
      url: "/api/get_track_list",
      dataType: "json"
      success: (data, textStatus, jqXHR) ->
        on_receive_track_list(data)
      error: (jqXHR, textStatus, errorThrown) ->
        console.log "Something is wrong..."
    })

  get_track_list()

console.log "ChromeとSafariでしか動作確認をしていません。FireFoxはたぶんコーデックが対応していないので音がならないと思います。"

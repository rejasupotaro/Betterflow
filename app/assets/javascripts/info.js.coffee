gif_list = [
  "http://gifsoup.com/webroot/animatedgifs/202105_o.gif"
  "http://ladygaga.glooce.com/wp-content/uploads/2012/08/tumblr_m2bsi5F22P1rowuemo1_500.gif"
  "http://25.media.tumblr.com/tumblr_m57sh3WUZ01rq5hnqo1_500.gif"
  "http://25.media.tumblr.com/tumblr_m57pruaBVO1qkxr27o1_500.gif"
  "http://25.media.tumblr.com/tumblr_m58rayl6wK1rr3wbgo3_250.gif"
  "http://25.media.tumblr.com/tumblr_m56fe3rZb51rq5hnqo3_250.gif"
  "http://25.media.tumblr.com/tumblr_m56f3t5zRR1rq5hnqo1_400.gif"
  "http://24.media.tumblr.com/tumblr_m52gj1rPle1rq5hnqo5_400.gif"
  "http://24.media.tumblr.com/tumblr_m51vwlirN01rw7wtoo1_500.gif"
  "http://25.media.tumblr.com/tumblr_m4zpo1OY4y1qi8gqpo1_500.gif"
  "http://24.media.tumblr.com/tumblr_m4z1hcfPDu1rvfsc2o1_r1_500.gif"
  "http://25.media.tumblr.com/tumblr_m4uv38Cs0w1ql45opo1_500.gif"
  "http://24.media.tumblr.com/tumblr_m4pmloX1yW1rpr8oyo2_500.gif"
  "http://25.media.tumblr.com/tumblr_m4hdb29U2M1r0ukd4o2_250.gif"
  "http://25.media.tumblr.com/tumblr_m4c32wdTIT1r81ssso1_500.gif"
  "http://24.media.tumblr.com/tumblr_m43a8eRCYj1rq5hnqo1_400.gif"
  "http://25.media.tumblr.com/tumblr_m3xyjw5TCG1rw2f00o4_250.gif"
  "http://media.tumblr.com/tumblr_m3mfconNUy1rouzv7.gif"
  "http://i939.photobucket.com/albums/ad232/letybruno/crystal-lady-gaga.gif"
  "http://fc03.deviantart.net/fs70/f/2010/078/f/8/Gaga_Cig_Glasses_Gif_BIG_by_MegaPaperGirl.gif"
  "http://images2.fanpop.com/image/photos/11100000/telephone-lady-gaga-11122126-400-224.gif"
  "http://fc09.deviantart.net/fs71/f/2010/315/3/9/bad_romance_lady_gaga_gif_by_ayaseyukiya02-d32n0b8.gif"
  "http://28.media.tumblr.com/tumblr_l4svmlR6ft1qc2jhfo1_400.gif"
  "http://26.media.tumblr.com/tumblr_lbi9j57E1m1qb0bobo1_500.gif"
  "http://25.media.tumblr.com/tumblr_lugq7eoMSc1r6ngxto1_500.gif"
  "http://legacy-cdn.smosh.com/smosh-pit/012011/gaga-whale.gif"
  "https://lh4.googleusercontent.com/-NRF8W44lMck/TcQIos-NL_I/AAAAAAAAAeM/V3tWJ_zvNzU/s288/JUDAS6.gif"
  "http://images4.fanpop.com/image/photos/19300000/Lady-GIF-lady-gaga-19306723-500-254.gif?1351354431932"
]

music_list = [
  "http://a1532.phobos.apple.com/us/r1000/110/Music/f6/81/50/mzm.awypklov.aac.p.m4a"
  "http://a1542.phobos.apple.com/us/r1000/100/Music/b8/13/82/mzm.tmcgwtiy.aac.p.m4a"
  "http://a1493.phobos.apple.com/us/r1000/100/Music/fd/ee/77/mzm.yaxakeuc.aac.p.m4a"
  "http://a20.phobos.apple.com/us/r1000/080/Music/d2/02/c7/mzm.cwkqxzmt.aac.p.m4a"
  "http://a1202.phobos.apple.com/us/r1000/106/Music/c2/d1/aa/mzm.pgjgerob.aac.p.m4a"
  "http://a566.phobos.apple.com/us/r1000/080/Music/37/fc/0e/mzm.rgqeiahx.aac.p.m4a"
  "http://a1393.phobos.apple.com/us/r1000/067/Music/e7/8b/12/mzm.pwdlffsd.aac.p.m4a"
  "http://a52.phobos.apple.com/us/r1000/069/Music/26/92/47/mzm.yjngsbkh.aac.p.m4a"
  "http://a51.phobos.apple.com/us/r1000/101/Music/b9/d7/44/mzm.rimfbjth.aac.p.m4a"
  "http://a218.phobos.apple.com/us/r1000/105/Music/6b/7b/db/mzm.twliiqfh.aac.p.m4a"
  "http://a1546.phobos.apple.com/us/r1000/117/Music/df/96/e1/mzm.lkfxjana.aac.p.m4a"
  "http://a538.v.phobos.apple.com/us/r1000/020/Video/9a/5e/45/mzi.ppknphmj..640x352.h264lc.u.p.m4v"
]

class Track
  constructor: (@artist_name = "----", @track_name = "----", @release_date = "----",
    @preview_url, @jacket_image_url, @track_view_url) ->

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
    background_image.style.backgroundImage =
      build_url(gif_list[get_random(gif_list.length)])
  set_background_image_random()

  set_track_info = (track) ->
    track_name = track.get_track_name()
    if track_name.length < 12
      $("#track_top_title")[0].innerHTML = track_name
    else if track_name.length < 18
      $("#track_top_title")[0].style.fontSize = "60px"
      $("#track_top_title")[0].innerHTML = track_name
    else
      $("#track_top_title")[0].style.fontSize = "52px"
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

  on_receive_track_list = (data) ->
    sample_json = data[0]
    for i in [0..3]
      track_list[i] = new Track(sample_json.artistName, sample_json.trackName, sample_json.releaseDate,
        music_list[i], sample_json.artworkUrl, sample_json.trackViewUrl)
    sample_json = data[1]
    for i in [4..7]
      track_list[i] = new Track(sample_json.artistName, sample_json.trackName, sample_json.releaseDate,
        music_list[i], sample_json.artworkUrl, sample_json.trackViewUrl)
    sample_json = data[2]
    for i in [8..11]
      track_list[i] = new Track(sample_json.artistName, sample_json.trackName, sample_json.releaseDate,
        music_list[i], sample_json.artworkUrl, sample_json.trackViewUrl)

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
        console.log "failed to request get_track_list"
    })

  get_track_list()
  #play_music()

console.log "ChromeとSafariでしか動作確認をしていません。FireFoxはたぶんコーデックが対応していないので音がならないと思います。"

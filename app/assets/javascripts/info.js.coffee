init = ->
  gif_list = [
    #"http://kksg.net/data/gif/77c7a08e4380318759b76eba8350b4d6",
    #"http://kksg.net/data/gif/1dce64287315c37e76d3f368109f1a7f"
    #"http://gifsoup.com/webroot/animatedgifs6/2491411_o.gif"
    "http://gifsoup.com/webroot/animatedgifs/202105_o.gif"
    "http://ladygaga.glooce.com/wp-content/uploads/2012/08/tumblr_m2bsi5F22P1rowuemo1_500.gif"
    "http://25.media.tumblr.com/tumblr_m5jqkkIA1B1rwk925o1_500.gif"
    "http://25.media.tumblr.com/tumblr_m57sh3WUZ01rq5hnqo1_500.gif"
    "http://25.media.tumblr.com/tumblr_m57pruaBVO1qkxr27o1_500.gif"
    "http://25.media.tumblr.com/tumblr_m5fgp3Dmvr1rq4liyo1_500.gif"
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
  ]

  build_url = (base_url) ->
    "url(" + base_url + ")"

  music_list = [
    #"http://a1715.v.phobos.apple.com/us/r1000/030/Video/aa/37/a6/mzm.fuodbbwq..640x352.h264lc.u.p.m4v",
    #"http://a119.v.phobos.apple.com/us/r1000/075/Video/7b/4c/7d/mzi.bcpryqoy..640x352.h264lc.u.p.m4v",
    #"http://a501.v.phobos.apple.com/us/r1000/043/Video/db/8a/46/mzm.pqjptsxr..640x480.h264lc.u.p.m4v"
    "http://a1532.phobos.apple.com/us/r1000/110/Music/f6/81/50/mzm.awypklov.aac.p.m4a"
    "http://a1542.phobos.apple.com/us/r1000/100/Music/b8/13/82/mzm.tmcgwtiy.aac.p.m4a"
    "http://a1493.phobos.apple.com/us/r1000/100/Music/fd/ee/77/mzm.yaxakeuc.aac.p.m4a"
    "http://a20.phobos.apple.com/us/r1000/080/Music/d2/02/c7/mzm.cwkqxzmt.aac.p.m4a"
    "http://a1202.phobos.apple.com/us/r1000/106/Music/c2/d1/aa/mzm.pgjgerob.aac.p.m4a"
    "http://a566.phobos.apple.com/us/r1000/080/Music/37/fc/0e/mzm.rgqeiahx.aac.p.m4a"
    "http://a1393.phobos.apple.com/us/r1000/067/Music/e7/8b/12/mzm.pwdlffsd.aac.p.m4a"
    "http://a52.phobos.apple.com/us/r1000/069/Music/26/92/47/mzm.yjngsbkh.aac.p.m4a"
    "http://a1225.phobos.apple.com/us/r1000/115/Music/8f/3f/61/mzm.vhojslrm.aac.p.m4a"
    "http://a51.phobos.apple.com/us/r1000/101/Music/b9/d7/44/mzm.rimfbjth.aac.p.m4a"
    "http://a218.phobos.apple.com/us/r1000/105/Music/6b/7b/db/mzm.twliiqfh.aac.p.m4a"
    "http://a1964.phobos.apple.com/us/r1000/071/Music/1b/d3/91/mzm.iyxjbpcv.aac.p.m4a"
    "http://a1546.phobos.apple.com/us/r1000/117/Music/df/96/e1/mzm.lkfxjana.aac.p.m4a"
  ]

  background_image = $("#gif_bg")[0]

  music_player = $("audio#music_player")[0]
  music_player.src = music_list[Math.floor(Math.random() * music_list.length)]

  scratch_player = $("audio#scratch_player")[0]
  #scratch_player.volume = 0.5

  set_background_image = ->
    background_image.style.backgroundImage = build_url(gif_list[Math.floor(Math.random() * gif_list.length)])
  play_music = ->
    music_player.play()
  play_scratch = ->
    scratch_player.play()

  set_background_image()

  music_player.addEventListener("ended", ->
    play_scratch()
    music_player.src = music_list[Math.floor(Math.random() * 3)])
  scratch_player.addEventListener("ended", ->
    play_music()
    set_background_image())

  play_music()

root = exports ? this
root.open_new_tab = (url) ->
  window.open(url)

window.onload = ->
  init()

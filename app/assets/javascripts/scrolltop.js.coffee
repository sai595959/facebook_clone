ready = ->    #これでページが読み込まれるときにcoffeescriptが読み込まれる
  $(window).scroll ->   #スクロールイベントを加える
    element = $('#page-top-btn')
    visible = element.is(':visible')    #ボタンが表示されているか
    height = $(window).scrollTop()
    if height > 400 #400以上で
      element.fadeIn() if !visible    #表示されてないときはフェードイン
    else
      element.fadeOut()
  $(document).on 'click', '#move-page-top', ->
    $('html, body').animate({ scrollTop: 0 }, 'slow')

$(document).ready(ready)   #これでページが読み込まれるときにcoffeescriptが読み込まれる
$(document).on('page:load', ready)   #これでページが読み込まれるときにcoffeescriptが読み込まれる

$ ->
  $(".message.closable .close.icon").on "click", ->
    $('.message.closable').fadeOut("slow")
    false

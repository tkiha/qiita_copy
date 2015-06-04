# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $(".markdown_preview").click ->
    $(".hidden_markdown").val($(".input_markdown").val())
    #alert $(".hidden_markdown").val()
    $(".preview_submit_form").submit()
    return false


$(document).ready(ready)
$(document).on('page:load', ready)

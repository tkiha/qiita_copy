$('.preview_submit_form').on 'ajax:success', (e, data, status, xhr) ->
  $('.markdown_preview_result').html(
    "<%= escape_javascript(render 'markdown_preview_result') %>"
  )

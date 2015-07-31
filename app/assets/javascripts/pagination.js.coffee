jQuery ->
   if $('#infinite-scrolling').size() > 0
    $(window).on 'scroll', ->
      more_cats_url = $('#infinite-scrolling .next_page a').attr('href')
      if more_cats_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
        $('#infinite-scrolling .pagination').html(
          '<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />')
        $.getScript more_cats_url
      return
    return
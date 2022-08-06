    if $('.pagination').length && $(".postsContainer").length
        $(window).scroll ->
                url = $('.pagination .next_page').attr('href')
                if url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
                    $('.pagination').html('<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />')
                    $.getScript(url)
        $(window).scroll()

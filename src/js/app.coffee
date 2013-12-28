$(document).ready ->
	tickerGo = ->
		$('.ticker').each ->
			eh	= $('> *:first-child', this).height()
			num = $(this).children().length
			i = 1

			setInterval(
				=>
					if i >= num
						i = 0

					$('> *:first-child', this).css 'margin-top', (i * eh * -1) + 'px'
					i++
				, 3000
			)

	iconBarWidths = ->
		icons = $('#iconbar .icon')
		width = $('.container').width() / icons.length
		icons.css
			width: Math.floor(width) + 'px'
			display: 'inline-block'

	$("a[href*=#]:not([href=#])").click (e)->
		if location.pathname.replace(/^\//, "") is @pathname.replace(/^\//, "") and location.hostname is @hostname
			target = $(@hash)
			target = (if target.length then target else $("[name=" + @hash.slice(1) + "]"))
			if target.length
				$("html,body").animate
					scrollTop: target.offset().top
				, 1000, 'swing', => window.location.hash = @hash

			e.preventDefault()
			return false


	$(window).on 'resize', do ->
		tickerGo()
		iconBarWidths()
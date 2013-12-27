$(document).ready ->
	tickerGo = ->
		$('.ticker').each ->
			eh  = $('> *:first-child', this).height()
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

	$('a[href^="#"]').on 'click', (e) ->
		$target = $($(@).attr('href'))
		$('html, body').animate { scrollTop: $target.offset().top }


		e.preventDefault()
		return false

	$(window).on 'resize', do ->
		tickerGo()
		iconBarWidths()
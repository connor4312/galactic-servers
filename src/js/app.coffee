$(document).ready ->
	setSlide = ->
		height = $(window).height()

		$('.slide').css
			'min-height': height + 'px'

	tickerGo = ->
		$('.ticker').each ->
			eh  = $('> *:first-child', this).height()
			num = $(this).children().length
			i = 0

			setInterval(
				=>
					if i >= num
						i = 0

					$('> *:first-child', this).css 'margin-top', (i * eh * -1) + 'px'
					i++
				, 3000
			)
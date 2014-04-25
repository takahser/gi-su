
jQuery ($) ->
	$body = $("body")
	$container = $("<div class=\"fadingBackground\" />")
	backgrounds = _.shuffle([
		"wp-content/uploads/backgrounds/1.jpg"
		"wp-content/uploads/backgrounds/2.jpg"
		"wp-content/uploads/backgrounds/3.jpg"
		"wp-content/uploads/backgrounds/4.jpg"
	])
	index = 0
	$inner1 = $("<div class=\"inner\"/>")
	$inner2 = $("<div class=\"inner\"/>")
	$container.append($inner1).append $inner2
	$body.append $container
	fade = ->
		$active = $container.find(".inner.active")
		$inactive = $container.find(".inner:not(.active)")
		if $active.length is 0
			
			# this will add the active class later, creating an initial fading effect
			$active = $inner1
			$inactive = $inner2
		background = backgrounds[index]
		$inactive.css "background-image", "url(" + background + ")"
		index = (index + 1) % backgrounds.length
		$active.removeClass "active"
		$inactive.addClass "active"
		

	window.setInterval fade, 8000
	_.defer fade

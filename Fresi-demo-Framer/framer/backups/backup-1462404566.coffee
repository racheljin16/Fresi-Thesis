# Import file "fresi_prototype_framer"
sketch = Framer.Importer.load("imported/fresi_prototype_framer@1x")


sketch.map_icons.opacity = 0
sketch.fm_info.opacity = 0
sketch.direction.opacity = 0
sketch.dark_mask.opacity = 0
sketch.number2.opacity = 0
sketch.quantity_dialog.opacity = 0
sketch.success.opacity = 0
  
# find a market
sketch.find.on Events.Click, ->
	sketch.find.animate
		properties: 
			scale: 1.1
		curve: "spring(100,10,0)"
		time: 0.2
	sketch.find.animate
		properties: 
			opacity: 0
		curve: "ease"
		time: 0.1
		delay: 0.2
	sketch.map.animate
		properties: 
			y: 0
		curve:"ease"
		time:1
		delay: 0.2
	sketch.morning.animate
		properties: 
			opacity: 0
	sketch.status_bar.animate
		properties: 
			opacity: 0
	sketch.searchbar.animate
		properties: 
			y: 0
		curve:"ease"
		time:1
	sketch.map_icons.animate
		properties: 
			opacity: 1
		curve:"ease"
		time:1
		delay: 0.5

# get fm info
sketch.fm_location.on Events.Click, ->
	sketch.fm_location.animate
		properties: 
			scale: 1.2
		curve: "spring(100,10,0)"
		time: 0.2
	sketch.fm_info.animate
		properties: 
			opacity: 1
		curve:"ease"
		time:1
		delay: 0.3
	sketch.direction.animate
		properties: 
			opacity: 1
		curve:"ease"
		time:1
		delay: 0.5

# go to market
sketch.fm_info.on Events.Click, ->
	sketch.fm_info.animate
		properties: 
			scale: 1.1
		curve: "spring(100,10,0)"
		time: 0.2
	sketch.A04MarketInfo.animate
		properties: 
			x: 0
		curve: "ease"
		time: 1
		delay: 0.2

#scroll
scroll = ScrollComponent.wrap(sketch.categories)
scroll.scrollHorizontal = false
scroll.contentInset =
	bottom:120

# go to vendor
sketch.fruits.on Events.Click, ->
	sketch.fruits.animate
		properties: 
			scaleY: 1.1
			y:10
		curve: "spring(100,10,0)"
		time: 0.2
	sketch.category.animate
		properties: 
			y: 100
		curve: "spring(100,10,0)"
		time: 0.2
		delay: 0.2
	sketch.A05Vendors.animate
		properties: 
			x: 0
		curve: "ease"
		time: 1
		delay: 0.8

# go to matt
sketch.matt.on Events.Click, ->
	sketch.matt.animate
		properties: 
			scale: 1.1
		curve: "spring(100,10,0)"
		time: 0.2
	sketch.A06VendorDetails.animate
		properties: 
			x: 0
		curve: "ease"
		time: 1
		delay: 0.2	

# reserve
sketch.reserve_button.on Events.Click, ->
	sketch.reserve_button.animate
		properties: 
			scale: 1.1
		curve: "spring(100,10,0)"
		time: 0.2
	sketch.A06page.animate
		properties: 
			blur: 15
			scale: 1.05
		curve: "ease"
		time: 0.2
	sketch.bottom_grey.animate
		properties: 
			blur: 15
			scale: 1.05
		curve: "ease"
		time: 0.2
	sketch.dark_mask.animate
		properties: 
			opacity: 1
		curve: "ease"
		time: 0.2
	sketch.quantity_dialog.animate
		properties: 
			opacity: 1
		curve: "spring(100,10,0)"
		time: 0.3
		delay: 0.2

# change number
sketch.add_number.on Events.Click, ->
	sketch.number2.animate
		properties: 
			opacity: 1
		curve: "spring(100,10,0)"
		time: 0.2
	sketch.number1.animate
		properties: 
			opacity: 0
		curve: "spring(100,10,0)"
		time: 0.2

# confirm number
sketch.confirm_quantity.on Events.Click, ->
	sketch.quantity_dialog.animate
		properties: 
			opacity: 0
			scale: 0.1
		curve: "spring(100,10,0)"
		time: 0.3
		delay: 0.2
	sketch.success.animate
		properties: 
			opacity: 1
		curve: "spring(100,10,0)"
		time: 0.3
		delay: 0.2

# go to map
sketch.to_map.on Events.Click, ->
	sketch.to_map.animate
		properties: 
			scale: 1.1
		curve: "spring(100,10,0)"
		time: 0.2
	sketch.A09VendorMap.animate
		properties: 
			x: 0
		curve: "ease"
		time: 0.3
		delay: 0.5

# enlarge map
sketch.fm_map.on Events.Click, ->
	sketch.fm_map.animate
		properties: 
			scale: 2
		curve: "spring(100,10,0)"
		time: 0.3
		delay: 0.2
		

		
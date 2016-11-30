# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: "Fresi-pre-order-flow"
	author: "Rachel Jin"
	twitter: ""
	description: ""

Framer.Defaults.Animation = curve: "spring(200,20,0)"

# Page 1 assets - homepage
homepageAll = new Layer
	width: 750
	height: 2557
	x: 0 
	y: 0

homepageMap = new Layer
	width: 750
	height: 757
	x: 0
	y: 0
	image: "images/homepage-map.jpg"
	parent: homepageAll
	backgroundColor: "#FFF"

homepageMarkets = new Layer
	width: 750
	height: 1800
	x: 0
	y: 757
	image: "images/homepage-markets.png"
	parent: homepageAll

homepageTabBar = new Layer
	width: 750
	height: 98
	x: 0
	y: 1236
	image: "images/homepage-tab-bar.jpg"
	index: 2
	
status = new Layer
	width: 750
	height: 34
	x: 0
	y: 0
	image: "images/homepage-status.png"
	index: 2
	
homepageSearch = new Layer
	width: 750
	height: 180
	image: "images/homepage-search.png"
	backgroundColor: "#fff"
	index: 1
	opacity: 0
# homepageSearch.states.add
# 	show:
# 		opacity: 1
# homepageSearch.states.animationOptions = curve: "spring(750,50,0)"
# time: 1

homepageCover = new Layer
	width: 656
	height: 369
	x: 47
	y: 221
	image: "images/homepage-cover.jpg"
	parent: homepageMarkets
	
# Homepage scroll	
homepageScroll = new ScrollComponent
	scrollHorizontal: false	
	width: 750
	height: 2557
	index: 0
	backgroundColor: "#FFF"
	contentInset:
		top: 0
		bottom: 1300
homepageAll.parent = homepageScroll.content

# Scroll animation
# homepageScroll.onSwipeUpEnd ->
# # 	print homepageScroll.content.y
# 	if homepageScroll.content.y < -420
# 		homepageSearch.states.switch("show")
# 	else
# 		homepageSearch.states.switch("default")
# 		
# homepageScroll.onSwipeDownEnd ->
# # 	print homepageScroll.content.y
# 	if homepageScroll.content.y >= -420
# 		homepageSearch.states.switch("default")
# 	else
# 		homepageSearch.states.switch("show")

homepageScroll.onMove ->
	scrolltoY(homepageScroll.scrollY)
	
scrolltoY = (y) ->
	homepageSearch.opacity = Utils.modulate(y, [300, 607], [0, 1], true)
	homepageMap.blur = Utils.modulate(y, [0, 607], [0, 30], true)
	home
	

# Homepage transition
homepageCover.onClick ->
	marketTitle.animate
		properties: 
			x: 0
		time: 0.3
	marketMainScroll.animate
		properties: 
			x: 0
		time: 0.3
	homepageSearch.states.switch("default")

# Page 2 assets - market page	
marketAll = new Layer
	width: 750
	x: 0
	y: 0

marketCategory = new Layer
	width: 750
	height: 4266
	x: 0
	y: 423
	image: "images/market-category.jpg"
	parent: marketAll

marketFruitCover = new Layer
	width: 656
	height: 370
	x: 50
	y: 200
	image: "images/market-fruit-cover.jpg"
	parent: marketCategory
	
# Hero images srcoll 
allIndicators = []	
amount = 4
heroImage = "images/market-hero-"

marketHeros = new PageComponent
	width: Screen.width 
	height: 423
	y: 0
	scrollVertical: false
	directionLock: true
	parent: marketAll
	
for i in [0...amount]
	imagePath = heroImage+"#{i+1}.jpg"
	marketHero = new Layer
		x: (marketHeros.width)*i, superLayer: marketHeros.content
		image: imagePath
		width: marketHeros.width
		height: 423
		y: 0

	indicator = new Layer 
		backgroundColor: "#fff"
		width: 12, height: 12
		x: 325+(28 * i), y: 389
		borderRadius: "50%", opacity: 0.5
		parent: marketAll

	indicator.x += (Screen.width / 2) - (92 * amount)

	indicator.states.add(active: {opacity: 1, scale:1.2})
	indicator.states.animationOptions = time: 0.5

	allIndicators.push(indicator)

marketHeros.snapToPage(marketHeros.content.subLayers[0])
current = marketHeros.horizontalPageIndex(marketHeros.currentPage)
allIndicators[current].states.switch("active")

marketHeros.on "change:currentPage", ->
	indicator.states.switch("default") for indicator in allIndicators
	
	current = marketHeros.horizontalPageIndex(marketHeros.currentPage)
	allIndicators[current].states.switch("active")
	
	marketHeros.previousPage.animate 
		properties: {scale: 0.75}
		curve: "spring", curveOptions: {tension: 100, friction: 50, velocity: 0, tolerance: 1}
			
	marketHeros.previousPage.once Events.AnimationEnd, -> this.scale = 1

# vertical scroll
marketMainScroll = new ScrollComponent
	scrollHorizontal: false	
	directionLock: true
	width: screen.width
	height: marketHeros.content.height+marketCategory.height
	x: 750
	y: 150
	index: 0
	backgroundColor: "#FFF"
	contentInset:
		top: 0
		bottom: 3600
marketAll.parent = marketMainScroll.content


marketTitle = new Layer
	width: 750
	height: 150
	x: 750
	image: "images/market-title.jpg"
	index: 0





	

	


	






 














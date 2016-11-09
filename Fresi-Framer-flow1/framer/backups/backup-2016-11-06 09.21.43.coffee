# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "Rachel Jin"
	twitter: ""
	description: ""


# Homepage scroll with search bar states switch

homepageAll = new Layer
	width: 750
	height: 2557
	x: 0, y: 0
	
homepageMap = new Layer
	x: 0, y: 0
	width: 750
	height: 1334
	image: "images/homepage-map.png"
	parent: homepageAll
	backgroundColor: "#FFF"

homepageTitle = new Layer
	width: 340
	height: 55
	image: "images/homepage-title.png"
	x: 50, y: 237
	parent: homepageMap
	opacity: 1

homepageText = new Layer
	width: 443
	height: 86
	image: "images/homepage-text.png"
	x:50, y: 334
	parent: homepageMap
	opacity: 1

homepageMarkets = new Layer
	width: 750
	height: 1800
	x: 0, y: 757
	image: "images/homepage-markets.png"
	parent: homepageAll

homepageSearch = new Layer
	backgroundColor: "#fff"
	width: 750
	height: 180
	image: "images/homepage-search.png"
	opacity: 0
homepageSearch.states.add
	show:
		opacity: 1
homepageSearch.states.animationOptions = curve: "spring(750,50,0)"
time: 1


status = new Layer
	width: 750
	height: 34
	image: "images/homepage-status.png"

homepageTabBar = new Layer
	width: 750
	height: 98
	x: 0, y: 1236
	image: "images/homepage-tab-bar.jpg"
	
homepageScroll = new ScrollComponent
	index: 0
	scrollHorizontal: false	
	width: 750
	height: 2557
	contentInset:
		top: 0
		bottom: 1300
homepageAll.parent = homepageScroll.content

homepageScroll.onSwipeUpEnd ->
# 	print homepageScroll.content.y
	if homepageScroll.content.y < -420
		homepageSearch.states.switch("show")
	else
		homepageSearch.states.switch("default")
		
homepageScroll.onSwipeDownEnd ->
# 	print homepageScroll.content.y
	if homepageScroll.content.y >= -420
		homepageSearch.states.switch("default")
	else
		homepageSearch.states.switch("show")

# Find a market

buttonFindMarket = new Layer
	width: 351
	height: 74
	image: "images/button-find-market.png"
	x: 50, y: 474
	parent: homepageMap
	

findMarketMap = new Layer
	width: 750
	height: 1332
	image: "images/find-market-map.jpg"
	index: -1
	opacity: 0

buttonFindMarket.onTap ->
	homepageTitle.animate
		properties: 
			visible = false
		curve: "spring(100,10,0)"
		time: 0.3
	homepageText.animate
		properties:
			visible = false
		curve: "spring(100,10,0)"
		time: 0.3
	buttonFindMarket.animate
		properties:
			visible = false
		curve: "spring(100,10,0)"
		time: 0.3
		print opacity
	homepageMarkets.animate
		y: 1334
		curve: "ease"
		time: 0.3
	homepageSearch.states.switch("show")

	






 














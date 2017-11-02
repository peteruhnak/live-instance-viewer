building
build
	| el |
	el := baseShape.
	self nameShape owningElement: el.
	^ el
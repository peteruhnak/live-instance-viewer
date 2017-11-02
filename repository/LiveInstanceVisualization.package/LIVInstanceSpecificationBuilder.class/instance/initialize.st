initialization
initialize
	super initialize.
	name := nil.
	slots := OrderedDictionary new.
	style := OPUmlStyle new
		fillColor: Color veryVeryLightGray;
		strokeColor: Color black;
		strokeWidth: 1
shapes
labelFor: aKey withText: text
	^ OPUmlLabel new
		text: text;
		modelElement: aKey;
		yourself
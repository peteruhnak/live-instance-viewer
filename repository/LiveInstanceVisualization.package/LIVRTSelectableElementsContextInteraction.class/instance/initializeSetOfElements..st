initialization
initializeSetOfElements: elements
 	elements do:
		[ :each | self initializeSingleElement: each ]
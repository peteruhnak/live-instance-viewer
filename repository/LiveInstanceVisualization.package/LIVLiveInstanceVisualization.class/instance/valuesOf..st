as yet unclassified
valuesOf: anObject
	^ (anObject class instanceVariables sorted
		collect: [ :each | each -> (anObject instVarNamed: each) ]) asOrderedDictionary
as yet unclassified
isReferenceValue: aValue of: anObject
	aValue class package = anObject class package
		ifTrue: [ ^ true ].
	(aValue isCollection
		and: [ aValue isNotEmpty and: [ aValue anyOne class package = anObject class package ] ])
		ifTrue: [ ^ true ].
	^ false
as yet unclassified
textFor: aValue of: anObject
	aValue class package = anObject class package
		ifTrue: [ ^ ' = ' , aValue class name ].
	(aValue isCollection
		and: [ aValue isNotEmpty and: [ aValue anyOne class package = anObject class package ] ])
		ifTrue: [ ^ ' : ' , aValue anyOne class name , '[*]', ' = an ' , aValue class name, '()' ].
	^ ' = ' , aValue printString
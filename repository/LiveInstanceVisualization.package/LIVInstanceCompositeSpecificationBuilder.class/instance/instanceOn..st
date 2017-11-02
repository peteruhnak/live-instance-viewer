as yet unclassified
instanceOn: anObject
	^ specs
		detect: [ :each | anObject isKindOf: each classifier ]
		ifFound: [ :each | each instanceOn: anObject ]
		ifNone: [ defaultBuilder instanceOn: anObject ]
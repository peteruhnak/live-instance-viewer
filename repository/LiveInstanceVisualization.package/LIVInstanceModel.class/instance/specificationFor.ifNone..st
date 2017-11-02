accessing
specificationFor: anObject ifNone: aBlock
	^ elements detect: [ :each | each instanceHash = anObject hash ] ifNone: aBlock
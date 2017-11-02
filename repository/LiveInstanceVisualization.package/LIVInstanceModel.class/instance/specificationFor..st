accessing
specificationFor: anObject
	^ elements detect: [ :each | each instanceHash = anObject hash ]
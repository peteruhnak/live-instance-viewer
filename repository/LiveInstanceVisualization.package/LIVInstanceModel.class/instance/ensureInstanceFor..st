adding
ensureInstanceFor: anObject
	^ self
		specificationFor: anObject
		ifAbsentPut: [ history specificationBuilder instanceOn: anObject ]
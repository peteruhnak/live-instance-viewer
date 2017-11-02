accessing
specificationFor: anObject ifAbsentPut: aBlock
	^ elements
		detect: [ :each | each instanceHash = anObject hash ]
		ifNone: [ | value |
			value := aBlock value.
			elements add: value.
			value ]
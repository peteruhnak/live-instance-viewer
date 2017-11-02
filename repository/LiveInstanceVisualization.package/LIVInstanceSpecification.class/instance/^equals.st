comparing
= aSpec
	self species = aSpec species
		ifFalse: [ ^ false ].
	^ self instanceHash = aSpec instanceHash
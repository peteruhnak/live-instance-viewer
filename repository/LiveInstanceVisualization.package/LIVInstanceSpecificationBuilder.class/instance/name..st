accessing
name: aStringOrBlock
	aStringOrBlock isString & aStringOrBlock isSymbol not
		ifTrue: [ name := [ :obj | aStringOrBlock ] ]
		ifFalse: [ name := aStringOrBlock ]
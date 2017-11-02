as yet unclassified
filterDuplicates: aCollection
	| filtered |
	aCollection ifEmpty: [ ^ aCollection ].
	filtered := OrderedCollection new.
	filtered add: aCollection first.
	aCollection allButFirst
		do: [ :model | 
			| diff |
			diff := LIVInstanceModelDiff new diffBetween: model and: filtered last.
			(self isEmptyDiffBetween: model and: filtered last)
				ifFalse: [ filtered add: model ] ].
	^ filtered
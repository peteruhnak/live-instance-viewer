testing
isEmptyDiffBetween: a and: b
	| diff |
	diff := LIVInstanceModelDiff new diffBetween: a and: b.
	(diff at: #added) ifNotEmpty: [ ^ false ].
	(diff at: #removed) ifNotEmpty: [ ^ false ].
	(diff at: #modified) values
		do: [ :each | 
			(each at: #added) ifNotEmpty: [ ^ false ].
			(each at: #removed) ifNotEmpty: [ ^ false ].
			(each at: #modified) ifNotEmpty: [ ^ false ] ].
	^ true